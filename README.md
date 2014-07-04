# ThumbnailHoverEffect

Introduces simple thumbnail 3D image hover effects using CSS 3D transforms.
The idea is inspired by [this great codedrops article] (http://tympanus.net/codrops/2012/06/18/3d-thumbnail-hover-effects/).


## Installation

Add this line to your application's Gemfile:

    gem 'thumbnail_hover_effect'

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install thumbnail_hover_effect

## Creating demonstration thumbnail hover effect

In order to get known with the thumbnail hover effect options you can create a demo thumbnail hover effect following the steps below:

__Creating thumbnail files__ 

Executing the following line in your rails application console:

    rails generate thumbnail demo

Add the following lines in your *application.css* file:

    *= require thumbnails/fontello.css
    *= require thumbnails/demo/demo.css.sass
 
__Rendering images with thumbnail hover effect__

Create a instances of the generated thumbnail class and call their *render* functions like this:

    <%= Demo.new.render({effect_number:1}) %>
    <%= Demo.new.render({effect_number:2}) %>
    <%= Demo.new.render({effect_number:3}) %>
    <%= Demo.new.render({effect_number:4}) %>

## Usage

### Basic Usage

In order to implement the thumbnail 3D image hover effects in your rails application follow the steps below:

__Creating thumbnail files__ 

Executing the following line in your rails application console:

    rails generate thumbnail class_name

is generating the files below:
    
   * app/thumnbnails/class_name.rb    
   * vendor/assets/stylesheets/thumbnails/class_name/class_name.css.sass
   * vendor/assets/stylesheets/thumbnails/fontello.css
   * vendor/assets/fonts/thumbnails/fontello.eot
   * vendor/assets/fonts/thumbnails/fontello.svg
   * vendor/assets/fonts/thumbnails/fontello.ttf
   * vendor/assets/fonts/thumbnails/fontello.woff

__Loading thumbnail css and fonts__

Add the following lines in your *application.css* file:

    *= require thumbnails/fontello.css
    *= require thumbnails/class_name/class_name.css.sass
 
__Rendering images with thumbnail hover effect__

Create a instance of the generated thumbnail class and call its *render* function like this:

    ClassName.new(
                    {
                        url:image.image_url,
                        attributes:{likes:'12', dislikes: '2'}
                    }
    ).render

Note: 

1.  The *url* parameter is mandatory and it is valid web url to image
 
2.  The *attributes* hash values are replaced in the HTML template
 
### Custom Usage

####Using the right settings#####

The gem generator is creating 3D image hover effects using CSS 3D transforms. Because of this, you are not able to use the generated *CSS* rules
for images with different width and height.

The generator uses default width and height if they are not supplied, but in most cases you will need to specify them:

    rails generate thumbnail class_name -w 400 -h 500
or

    rails generate thumbnail class_name --width=400 --height=500

**Note**: If you need to use the effect for images with various width and height you need to generated separated *CSS* files.

####Thumbnail Effects#####

There are four built-in thumbnail effects. By default, the generator is generating *CSS* rules for all of them.

1. How to generate *CSS* for specific thumbnail effect only?

    In order to reduce the generated *CSS* rules you can render one or more specific effects like follows:

        rails generate thumbnail class_name -w 400 -h 500 -e 1,2 #renders css for first and second effects
        rails generate thumbnail class_name -w 400 -h 500 -e 3   #renders css for third effect only
    
    **Note**: The possible options for the *effects* are *1*,*2*,*3* and *4*.

2. How to choose which effect to be used?

   By default the render function is using the smallest effect. For example, if you have *CSS* rules for the third and the forth effect,
   the following code is using the third:

        ClassName.new(
                        {
                            url:image.image_url,
                            attributes:{download_url:'download_url'}
                        }
        ).render

   If you need to specify an effect you can pass it as *render* function parameter:
    
        ClassName.new(
                        {
                            url:image.image_url,
                            attributes:{download_url:'download_url'}
                        }
        ).render({effect_number:4})

####Thumbnail Template#####

Creating a thumbnail *HTML* template is the key part of the thumbnail image hover 3D effect. Basically, this is the *HTML*,
which is shown on image hover event and it can be customized to meet the developer needs.

1. How to create *HTML* thumbnail template?

    The template is extracted from your ruby *class_name*. In order to changed it you need to edit the *get_template*
    function in tour *thumbnails/class_name.rb* file. It looks like this:
    
          # returns the html template
          def get_template(effect_number)
            "
               <div class=\"view-class_name effect0#{effect_number ||= 3}\">
                <div>
                  #ADD YOUR HTML HERE
                </div>
                <div class=\"slice\" style=\"background-image: url(##url##);\">
                  ..
                </div>
              </div>
            "
          end

2. How to pass arguments to thumbnail template?

   You are passing dynamics values to your template using the class's constructor *attributes* hash. For example:
   
        ClassName.new(
                        {
                            url: image.image_url,
                            attributes: {likes:'12', dislikes: '2'}
                        }
        ).render
        
   is replacing the *##likes##* and *##dislikes##* placeholders in your *HTML* template.        
        
   **Note**: Do not use the *##url##* placeholder as it is internal.       
        
3. Is there a default template?

   There is a dummy default template.

4. Are there any *HTML* templates example?

   I am going to provided a link to templates that I am using soon.

5. How to make a good *HTML* thumbnail template?

   It depends on your images width and height. If your image is bigger you can embedded some text as well.
   I prefer using font icons with links.

####Thumbnail Template#####

The gem is coming with the nice [fontello font icons](http://fontello.com/). You can use them in order to
create simple and good looking thumbnail *HTML* templates.

1. How to disable *fontello* font icons generation?

   The *fontello* font icons files generation can be disabled as it is shown below:
   
        rails generate thumbnail class_name -i false
   or
   
        rails generate thumbnail class_name --skips-icons

2. How to use *fontello* font icons?

   Just used the appropriate class in your *HTML* template.

3. Where to see the available font icons?

   Check the [official web site](http://fontello.com/)
   
4. Additional settings

   Check the generated *vendor/assets/stylesheets/thumbnails/fontello.css* file for more settings like
   3D effects and making icons bigger or smaller.

