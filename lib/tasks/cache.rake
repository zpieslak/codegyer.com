namespace :pages do
  desc "Cache ALL the pages!"
  task :cache => :environment do
    # First, let's instantiate a new session so we can `get` our paths,
    # just like if we were writing an integration test
    app = ActionDispatch::Integration::Session.new(Rails.application)

    gz = Zlib::GzipReader.new File.open([Rails.root, 'public', 'sitemap.xml.gz'].join('/'))
    doc = Nokogiri::XML gz.read
    links = doc.css('loc').map{ |l| URI(l.text).path } + ['/contact/success']

    ## Now, we'll loop through each path we want to cache
    links.each do |path|
      # Get the path
      app.get path

      # Let's figure out the file path/name to which we're saving the file
      #file_path = "/cache/#{path.gsub('/', '_')[1,path.length]}"

      # And now let's cache the response body HTML, using the ActionController's
      #ApplicationController.cache_page(app.response.body, file_path)
    end
  end
end
