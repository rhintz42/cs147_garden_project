module PersonalPlantsHelper
  def calendar(date = Date.today, &block)
    #debugger
    Calendar.new(self, date, @personal_plant[:id], block).table
  end

  class Calendar < Struct.new(:view, :date, :pp, :callback)
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
          week.map {|day| day_cell(day) }.join.html_safe
        end
      end.join.html_safe
    end

    def day_cell(day)
      #debugger
      #content_tag :td, view.capture(day, &callback), class: day_classes(day)
      #debugger
      '<td class="'+day_classes(day).to_s+'">
        <a class="fill-div" href="/personal_plant_waterings/new?pp='+pp.to_s+'&wt='+day.to_s+'" data-rel="popup" data-position-to="window" data-inline="true">'+view.capture(day, &callback)+'</a></td>'
    end

    def day_classes(day)
      classes = []
      classes << "today" if day == Date.today
      classes << "notmonth" if day.month != date.month
      classes << "watered" if view.capture(day, &callback)['watered']
      classes.empty? ? nil : classes.join(" ")
    end

    def weeks
      first = date.beginning_of_month.beginning_of_week(START_DAY)
      last = date.end_of_month.end_of_week(START_DAY)
      (first..last).to_a.in_groups_of(7)
    end
  end
end
