module CalendarHelper
  def monthly_calendar(date = Date.today, &block)
    Calendar.new(self, :monthly, date, block).table
  end

  def weekly_calendar(date = Date.today, &block)
    Calendar.new(self, :weekly, date, block).table
  end

#  def calendar(date = Date.today, &block)
#    Calendar.new(self, date, block).table
#  end

  class Calendar < Struct.new(:view, :mode, :date, :callback)
    HEADER = %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday]
    START_DAY = :sunday

    delegate :content_tag, to: :view

    def table
      content_tag :table, class: "calendar" do
        header + week_rows
      end
    end

    def header
      content_tag :tr do
        HEADER.map { |day| content_tag :th, day }.join.html_safe
      end
    end

    def week_rows
      weeks.map do |week|
        content_tag :tr do
          week.map { |day| day_cell(day) }.join.html_safe
        end
      end.join.html_safe
    end

    def day_cell(day)
      if mode == :monthly
        content_tag :td, view.capture(day, &callback), class: day_classes(day)
      elsif mode == :weekly
        content_tag :td, view.capture(day, &callback), class: day_classes(day)
      end
    end

    def day_classes(day)
      classes = []
      classes << "today" if day == Date.today
      classes << "notmonth" if day.month != date.month
      classes.empty? ? nil : classes.join(" ")
    end

    def weeks
      if mode == :monthly
        first = date.beginning_of_month.beginning_of_week(START_DAY)
        last = date.end_of_month.end_of_week(START_DAY)
        (first..last).to_a.in_groups_of(7)
      elsif mode == :weekly
        first = date.beginning_of_week(START_DAY)
        last = date.end_of_week(START_DAY)
        (first..last).to_a.in_groups_of(7)
      end
        
    end
  end
end