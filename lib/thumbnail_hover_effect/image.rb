module ThumbnailHoverEffect
  #
  class Image

    # image use if such is not specified
    IMAGE_NOT_FOUND = '/images/no-image-found.jpg'

    # thumbnail effect template
    THUMBNAIL_TEMPLATE =
    "
    <div class=\"view-effect01 effect01\">
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

      has_thumbnail = parameters.fetch(:has_thumbnail, nil)
      thumbnail_template = parameters.fetch(:thumbnail_template, THUMBNAIL_TEMPLATE).dup

      if has_thumbnail
        @attributes.map { |key, value| thumbnail_template["##{key}##"] &&= value }
        thumbnail_template.gsub!('##url##', @url)
      else
        self.to_s
      end
    end

  end
end
