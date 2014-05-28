module ThumbnailHoverEffect
  #
  class Image

    # image use if such is not specified
    IMAGE_NOT_FOUND = '/images/no-image-found.jpg'

    # class attributes
    attr_accessor :url,         # image source url
                  :attributes   # data attributes

    # validating input parameters and using defaults if necessary
    def initialize(parameters = {})
      @url = parameters.fetch(:url, IMAGE_NOT_FOUND)
      @attributes = parameters.fetch(:attributes, {})

      @url = IMAGE_NOT_FOUND unless File.extname(@url) =~/^(.png|.gif|.jpg)$/ #@url =~/^#{URI::regexp}$/ and
      @attributes = {} unless @attributes.is_a?(Hash)
    end

    # rendering image without thumbnail effect
    def to_s
      "<img src=#{@url} #{@attributes.map{|key,value| "data-#{key}=#{value}" }.join(' ')}/>"
    end

    # rendering image with thumbnail effect applied
    def render(parameters = {})

      has_thumbnail = parameters.fetch(:has_thumbnail, true)
      thumbnail_template = self.get_template

      if has_thumbnail
        @attributes.map { |key, value| thumbnail_template["###{key}##"] &&= value }
        thumbnail_template.gsub!('##url##', @url).html_safe
      else
        self.to_s.html_safe
      end
    end

    # returns the html template
    def get_template
      "
      <div class=\"view-image effect01\">
        <div>
        <span class=\"icon-emo-happy\">##title##</span>
        <span class=\"icon-emo-happy\">##description##</span>
        <a href=\"##url##\"><span aria-hidden=\"true\" class=\"icon-emo-happy\"></span></a>
        </div>
        <div class=\"slice\" style=\"background-image: url(##url##);\">
          <span class=\"overlay\"></span>
          <div class=\"slice\" style=\"background-image: url(##url##);\">
            <span class=\"overlay\"></span>
            <div class=\"slice\" style=\"background-image: url(##url##);\">
              <span class=\"overlay\"></span>
              <div class=\"slice\" style=\"background-image: url(##url##);\">
                <span class=\"overlay\"></span>
                <div class=\"slice\" style=\"background-image: url(##url##);\">
                  <span class=\"overlay\"></span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      "
    end


  end
end
