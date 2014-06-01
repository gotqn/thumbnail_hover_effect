# encoding: utf-8

class <%= get_class_name %> < ThumbnailHoverEffect::Image

  # Provide a default URL as a default if there hasn't been a correct one
  # IMAGE_NOT_FOUND = '/images/no-image-found.jpg'

  # returns the html template
  def get_template(effect_number)
    "
       <div class=\"view-<%= get_file_name %> effect0#{<%= default_effect %> unless effect_number}\">
        <div>
          <span style=\"position: absolute;right: 5px;top: 10px;\"  class=\"icon-thumbs-up\">##likes##</span>
          <span style=\"position: absolute;right: 5px;top: 30px;\"class=\"icon-thumbs-down\">##dislikes##</span>
          <a style=\"position: absolute;bottom: 10px;right: 5px;\" href=\"##url##\">
            <span aria-hidden=\"true\" class=\"icon-print\"></span>
          </a>
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
