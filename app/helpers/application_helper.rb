module ApplicationHelper

  def hours(label=false, availability=nil)
    content_tag :div, class: "hours" do
      if label.present?
        inc = 1
        css = "hour"
      else
        inc = 0.5
        css = "half_hour"
      end

      if availability.present?
        ((availability.start_i)..(availability.end_i)).step(inc).to_a.collect do |i|
          "<div class=\"#{css}\">#{(Time.utc(0)+i.hour).strftime("%-I%P") if (i/ 0.5) % 2 == 0 && label}</div>".html_safe
        end.reduce(:<<) # Will concat using the SafeBuffer instead of String with join
      else
        (0..23.5).step(inc).to_a.collect do |i|
          "<div class=\"#{css}\">#{(Time.utc(0)+i.hour).strftime("%-I%P") if (i/ 0.5) % 2 == 0 && label}</div>".html_safe
        end.reduce(:<<) # Will concat using the SafeBuffer instead of String with join
      end
    end
  end
end
