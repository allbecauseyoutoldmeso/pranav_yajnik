require 'rails_helper'

RSpec.describe LessonsController, type: :controller do

  describe 'index' do

    let!(:photo) { create(:photo) }
    let!(:photo_placer) { create(:photo_placer, place: 'lessons', photo: photo) }
    let!(:lesson_1) { create(:lesson) }
    let!(:lesson_2) { create(:lesson) }

    before do
      get :index
    end

    it 'assigns lesson image url' do
      expect(assigns(:photo_url)).to eq photo.international_url
    end

    it 'assigns lessons' do
      expect(assigns(:lessons)).to eq [lesson_1, lesson_2]
    end
  end

  context 'admin user' do
    let(:admin) { create(:admin) }

    before do
      sign_in admin
    end

    describe 'create' do

      let(:params) do
        { lesson:
          {
            what: 'Beginners',
            where: '123 Pranav Street, London, AB1 2CD',
            day: 3,
            time: '18:00'.to_time
          }
        }
      end

      it 'creates a lesson' do
        expect{ post :create, params: params }.to change{ Lesson.count }.from(0).to(1)
      end

      it 'redirects to lessons page' do
        post :create, params: params
        expect(response).to redirect_to lessons_path
      end
    end

    describe 'update' do
      let(:lesson) { create(:lesson, day: 1) }
      let(:params) do
        { id: lesson.id,
          lesson:
          {
            day: 2,
          }
        }
      end

      it 'updates the lesson' do
        expect{ post :update, params: params }.to change{ lesson.reload.day }.from(1).to(2)
      end

      it 'redirects to lessons page' do
        post :update, params: params
        expect(response).to redirect_to lessons_path
      end
    end

    describe 'destroy' do
      let!(:lesson) { create(:lesson) }
      let(:params) do
        { id: lesson.id }
      end

      it 'destroys the lesson' do
        expect{ post :destroy, params: params }.to change{ Lesson.count }.from(1).to(0)
      end

      it 'redirects to lessons page' do
        post :destroy, params: params
        expect(response).to redirect_to lessons_path
      end
    end
  end
end
