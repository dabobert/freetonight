module ApplicationHelper

  def hours(availabilities=nil, *args)
    options = args.extract_options!

    content_tag :div, class: "hours" do
      if options[:label].present?
        inc = 1
        css = "hour"
      else
        inc = 0.5
        css = "half_hour"
      end

      if availabilities.present?
        availabilities.collect do |availability|
          if availability == "xxx"
            content_tag :div, "~~~~~~~~~~", class: :break
          else
            availability.step(inc).collect do |i|
              next if i == availability.max
              "<div class=\"#{css}\">#{(Time.utc(0)+i.hour).strftime("%-I%P") if (i/ 0.5) % 2 == 0 && options[:label].present? }</div>".html_safe
            end.reduce(:<<) # Will concat using the SafeBuffer instead of String with join
          end
        end.reduce(:<<)
      else
        (0..23.5).step(inc).collect do |i|
          "<div class=\"#{css}\">#{(Time.utc(0)+i.hour).strftime("%-I%P") if (i/ 0.5) % 2 == 0 && options[:label].present? }</div>".html_safe
        end.reduce(:<<) # Will concat using the SafeBuffer instead of String with join
      end
    end
  end
end
