xml.instruct!

xml.urlset(xmlns: 'http://www.sitemaps.org/schemas/sitemap/0.9') do
  xml.url do
    xml.loc root_url
    xml.changefreq('monthly')
    xml.priority '1.0'
  end
  @pages.each do |page|
    xml.url do
      xml.loc root_url + page
      xml.changefreq('monthly')
      xml.priority '0.8'
      xml.lastmod '2017-12-03T18:24:14.43+00:00'
    end
  end
end
