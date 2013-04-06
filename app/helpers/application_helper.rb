module ApplicationHelper

  def hours(label=false)
    content_tag :div, class: "hours" do
      (0..23).step(0.5).to_a.collect do |i|
        "<div class=\"half_hour\">#{(Time.utc(0)+i.hour).strftime("%-I%P") if (i/ 0.5) % 2 == 0 && label}</div>".html_safe
        #"<div class=\"half_hour\">&nbsp;</div>".html_safe
        #content_tag :div, :class => "half_hour"
      end.reduce(:<<) # Will concat using the SafeBuffer instead of String with join
    end
  end
end
