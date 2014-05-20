# encoding: utf-8

class <%= get_class_name %> < ThumbnailHoverEffect::Image

  # Provide a default URL as a default if there hasn't been a correct one
  # IMAGE_NOT_FOUND = '/images/no-image-found.jpg'

  # returns the html template
  def get_template
    "
       <div class=\"view-<%= get_file_name %> <%= default_effect %>\">
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
