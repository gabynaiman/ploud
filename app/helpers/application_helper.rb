module ApplicationHelper

  def show_flash
    content_tag :div do
      flash.each do |key, value|
        concat(
          content_tag(:div, :id => key) do
            concat value
          end
        )
      end
    end
  end

end
