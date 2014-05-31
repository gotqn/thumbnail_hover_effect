class ThumbnailGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  desc  'Generates ruby class and css classes for thumbnail 3D hover effects'

  argument :name, type: 'string', required: true,
           desc: 'specifies generated ruby class and css class names'

  class_option :width, type: 'numeric', default: 300, aliases: '-w',
               desc: 'specifies image width'

  class_option :height, type: 'numeric', default: 216, aliases: '-h',
               desc: 'specifies image height'

  class_option :effects, type: 'array', default: [1, 2, 3, 4], aliases: '-e',
               desc: 'specifies for which of the effects css classes are generated'

  class_option :icons_size, type: 'numeric', default: 12, aliases: '-is',
               desc: 'specifies the font icon size'

  class_option :icons, type: 'boolean', default: true, aliases: '-i',
               desc: 'disables icons files generation'

  def generate_layout

    # core functionality
    template 'thumbnail.rb', "app/thumbnails/#{get_file_name}.rb"
    template 'effects.css.sass.erb', "vendor/assets/stylesheets/thumbnails/#{get_file_name}/#{get_file_name}.css.sass"

    # additional functionality - generation font icons
    if options[:icons]
      copy_file "fonts/font_size_#{get_font_size}/icon#{get_font_size}.css",
                "vendor/assets/stylesheets/thumbnails/#{get_file_name}/icon#{get_font_size}.css"

      case get_font_size
        when 12
          begin
            copy_file 'fonts/font_size_12/icon12.eot', 'vendor/assets/fonts/thumbnails/font_size_12/icon12.eot'
            copy_file 'fonts/font_size_12/icon12.svg', 'vendor/assets/fonts/thumbnails/font_size_12/icon12.svg'
            copy_file 'fonts/font_size_12/icon12.ttf', 'vendor/assets/fonts/thumbnails/font_size_12/icon12.ttf'
            copy_file 'fonts/font_size_12/icon12.woff', 'vendor/assets/fonts/thumbnails/font_size_12/icon12.woff'
          end
        when 18
          begin
            copy_file 'fonts/font_size_18/icon18.eot', 'vendor/assets/fonts/thumbnails/font_size_18/icon18.eot'
            copy_file 'fonts/font_size_18/icon18.svg', 'vendor/assets/fonts/thumbnails/font_size_18/icon18.svg'
            copy_file 'fonts/font_size_18/icon18.ttf', 'vendor/assets/fonts/thumbnails/font_size_18/icon18.ttf'
            copy_file 'fonts/font_size_18/icon18.woff', 'vendor/assets/fonts/thumbnails/font_size_18/icon18.woff'
          end
        when 24
          begin
            copy_file 'fonts/font_size_24/icon24.eot', 'vendor/assets/fonts/thumbnails/font_size_24/icon24.eot'
            copy_file 'fonts/font_size_24/icon24.svg', 'vendor/assets/fonts/thumbnails/font_size_24/icon24.svg'
            copy_file 'fonts/font_size_24/icon24.ttf', 'vendor/assets/fonts/thumbnails/font_size_24/icon24.ttf'
            copy_file 'fonts/font_size_24/icon24.woff', 'vendor/assets/fonts/thumbnails/font_size_24/icon24.woff'
          end
        else
          # the same as options[:icon_size] = 12
      end
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
      options.effects.min
    end

    def get_font_size
      case options[:icon_size]
        when 12, 18, 24
          return options[:icon_size]
        else
          return 12
      end
    end

end