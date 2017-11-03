require 'open-uri'

module API
  module V1
    class Pages < Grape::API
      include API::V1::Defaults

      resources :pages do
        desc 'Return a list of pages', entity: API::V1::Entities::Page
        get '/' do
          pages = Page.all
          present pages, with: API::V1::Entities::Page
        end

        desc 'create a new page with the tags'
        params do
          requires :page_url, type: String, desc: 'The page url'
        end
        post '/' do
          docs = Nokogiri::HTML(open(params[:page_url]))
          h_tags = {
            h1: docs.css('h1'),
            h2: docs.css('h2'),
            h3: docs.css('h3')
          }
          anchors = docs.css('a').map { |link| link.attribute('href').to_s }.uniq.delete_if { |href| href.empty? }

          page = Page.create(params)

          text_and_strip = proc { |str| str.text.strip }

          anchors = anchors.map { |a| { content: a, content_type: :anchor } }
          headers = h_tags.map do |key, value|
            value.map(&text_and_strip).map do |val|
              {
                content: val,
                content_type: key
              }
            end
          end.flatten

          page.tags.create(anchors + headers)

          status 200
          present page, with: API::V1::Entities::Page
        end

      end
    end
  end
end
