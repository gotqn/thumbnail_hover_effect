class ThumbnailGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  desc  'Generates ruby class and css classes for thumbnail 3D hover effects'

  argument :name, type: 'string', required: true,
           desc: 'specifies generated ruby class and css class names'

  class_option :width, type: 'numeric', default: 300, aliases: '-w',
               desc: 'specifies image width'

  class_option :height, type: 'numeric', default: 216, aliases: '-h',
               desc: 'specifies image height'

  class_option :effects, type: 'array', default: [1, 2, 3, 4], aliases: '--e',
               desc: 'specifies for which of the effects css classes are generated'

  class_option :icons, type: 'boolean', default: true, aliases: '-i',
               desc: 'disables icons files generation'

  class_option :icons_size, type: 'numeric', default: 12, aliases: '--s',
               desc: 'specifies the font icons size'

  def generate_layout

    # core functionality
    template 'thumbnail.rb', "app/thumbnails/#{get_file_name}.rb"
    template 'effects.css.sass.erb', "vendor/assets/stylesheets/thumbnails/#{get_file_name}/#{get_file_name}.css.sass"

    # additional functionality - generation font icons
    if options[:icons]
      copy_file "fonts/font_size_#{get_font_size}/icon#{get_font_size}.css",
                "vendor/assets/stylesheets/thumbnails/#{get_file_name}/icon#{get_font_size}.css"
      copy_file "fonts/font_size_#{get_font_size}/icon#{get_font_size}.eot",
                "vendor/assets/fonts/thumbnails/font_size_#{get_font_size}/icon#{get_font_size}.eot"
      copy_file "fonts/font_size_#{get_font_size}/icon#{get_font_size}.svg",
                "vendor/assets/fonts/thumbnails/font_size_#{get_font_size}/icon#{get_font_size}.svg"
      copy_file "fonts/font_size_#{get_font_size}/icon#{get_font_size}.ttf",
                "vendor/assets/fonts/thumbnails/font_size_#{get_font_size}/icon#{get_font_size}.ttf"
      copy_file "fonts/font_size_#{get_font_size}/icon#{get_font_size}.woff",
                "vendor/assets/fonts/thumbnails/font_size_#{get_font_size}/icon#{get_font_size}.woff"
    end
  end

  private

    def get_file_name
      name.underscore
    end

    def get_class_name
      name.camelize
    end

    def get_width
      options[:width]
    end

    def get_height
      options[:height]
    end

    def should_be_effect_rendered(param)
      options[:effects].include? param
    end

    def default_effect
      options[:effects].min
    end

    def get_font_size
      case options[:icons_size]
        when 12, 18, 24
          return options[:icons_size]
        else
          return 12
      end
    end

end