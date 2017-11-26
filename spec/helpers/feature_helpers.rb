module FeatureHelpers

  def sign_in_admin
    admin = Admin.create(email: 'example@example.com', password: '123456', password_confirmation: '123456')
    sign_in admin
  end
end
