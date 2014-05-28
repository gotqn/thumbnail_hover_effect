class ThumbnailGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  argument :name, type: 'string', required: true
  method_options :width, type: 'numeric', default: 300
  method_options :height, type: 'numeric', default: 216
  method_options :effects, type: 'hash', default: {effect01: true, effect02: true, effect03: true, effect04: true}
  #method_options :force => :boolean, :aliases => "-f"
  def generate_layout
    template 'thumbnail.rb', "app/thumbnails/#{get_file_name}.rb"
    template 'effects.css.sass.erb', "vendor/assets/stylesheets/thumbnails/#{get_file_name}.css.sass"
  end

  private

    def get_file_name
      name.underscore
    end

    def get_class_name
      name.camelize
    end

    def get_width
      width
    end

    def get_height
      height
    end

    def should_be_effect_rendered(param)
      effects[param.to_sym]
    end

    def default_effect
      effects.key(true)
    end

end