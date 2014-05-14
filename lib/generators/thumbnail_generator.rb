class ThumbnailGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  argument :name, type: 'string', required: true
  argument :width, type: 'numeric', default: 300
  argument :height, type: 'numeric', default: 216
  argument :effects, type: 'hash', default: {effect01: true, effect02: true, effect03: true, effect04: true}

  def generate_layout
    #copy_file "stylesheet.css", "public/stylesheets/#{file_name}.css"
    #template "layout.html.erb", "app/views/layouts/#{file_name}.html.erb"
    #template "uploader.rb", "app/uploaders/#{file_name}_uploader.rb"

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
      effects[param]
    end

    def default_effect
      effects.key(true)
    end

end