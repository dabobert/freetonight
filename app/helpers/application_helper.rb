module ApplicationHelper

  def hours(label=false)
    content_tag :div, class: "hours" do
      if label.present?
        inc = 1
        css = "hour"
      else
        inc = 0.5
        css = "half_hour"
      end

      (0..23.5).step(inc).to_a.collect do |i|
        "<div class=\"#{css}\">#{(Time.utc(0)+i.hour).strftime("%-I%P") if (i/ 0.5) % 2 == 0 && label}</div>".html_safe
        #"<div class=\"half_hour\">&nbsp;</div>".html_safe
        #content_tag :div, :class => "half_hour"
      end.reduce(:<<) # Will concat using the SafeBuffer instead of String with join
    end
  end
end
