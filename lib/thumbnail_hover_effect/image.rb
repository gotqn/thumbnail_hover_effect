module ThumbnailHoverEffect
  #
  class Image

    #
    IMAGE_NOT_FOUND = '/images/no-image-found.jpg'


    THUMBNAIL_TEMPLATE = [
        '<div class="view-ff97e1e1-22d4-44cf-bf5d-ef1e26444a06 effect02">',
        '<div>',
        '<span class="icon-emo-happy">##title##</span>',
        '<span class="icon-emo-happy">##description##</span>',
        '<a href="##url##"><span aria-hidden="true" class="icon-emo-happy""></span></a>',
        '</div>',
        '<div class="slice" style="background-image: url(##url##);">',
        '<span class="overlay"></span>',
        '<div class="slice" style="background-image: url(##url##);">',
        '<span class="overlay"></span>',
        '<div class="slice" style="background-image: url(##url##);">',
        '<span class="overlay"></span>',
        '<div class="slice" style="background-image: url(##url##);">',
        '<span class="overlay"></span>',
        '<div class="slice" style="background-image: url(##url##);">',
        '<span class="overlay"></span>',
        '</div>',
        '</div>',
        '</div>',
        '</div>',
        '</div>',
        '</div>',
    ].join('')
    #
    attr_accessor :url,         # image source url
                  :attributes   # data attributes

    #
    def initialize(parameters = {})
      @url = parameters.fetch(:url, IMAGE_NOT_FOUND)
      @attributes = parameters.fetch(:attributes, {})

      @url = IMAGE_NOT_FOUND unless File.extname(@url) =~/^(.png|.gif|.jpg)$/ #@url =~/^#{URI::regexp}$/ and
      @attributes = {} unless @attributes.is_a?(Hash)
    end

    #
    def to_s
      "<img src=#{@url} #{@attributes.map{|key,value| "data-#{key}=#{value}" }.join(' ')}/>"
    end

    #
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
