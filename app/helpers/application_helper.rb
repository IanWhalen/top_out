module ApplicationHelper
  def image_url(source)
    "#{root_url[0...-1]}#{image_path(source)}"
  end
end
