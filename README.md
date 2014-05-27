# ThumbnailHoverEffect

Introduces simple image thumbnail 3D hover effects using CSS 3D transforms. The idea is inspired by [this greate codedrops article] (http://tympanus.net/codrops/2012/06/18/3d-thumbnail-hover-effects/ code drops article).


## Installation

Add this line to your application's Gemfile:

    gem 'thumbnail_hover_effect'

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install thumbnail_hover_effect

## Usage

### Basic Usage

In order to implement the thumbnail 3D hover effects in your rails application follow the steps below:

__Creating thumbnail files__ 

Executing the following line in your rails application folder:

    rails generate thumbnail class_name

is generating the files below:
    
   * app/thumbnails/class_name.rb
   * vendor/assets/stylesheets/thumbnails/class_name.css.sass

__Loading thumnbail css and fonts__

Add the following lines in your *application.css* file:

    *= require fonts.css
    *= require thumbnails/effect.css.sass
 
__Rendering images with thumbnail hover effect__

Create a instance from the generated thumbnail class and call its *render* function like this:

    ClassName.new(
                    {
                        url:image.image_url,
                        attributes:{likes:'12', dislikes: '2'}
                    }
    ).render

Note: 

1.  The *url* parameter is mandatory and it is valid web url to image
 
2.  The *attributes* hash values are replaced in the HTML template (check the next section for more details)
 
### Custom Usage



## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
