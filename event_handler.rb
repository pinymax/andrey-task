require 'active_support/core_ext/date'

class EventDateHandler
  def initialize(last_event_date)
    @last_event_date = Date.parse(last_event_date)
    @next_event_date = @last_event_date.next_month
  end

  def get_next_event_date
    if @next_event_date.on_weekend?
      @next_event_date = if last_week_of_the_month?
                           @next_event_date.last_weekday
                         else
                           @next_event_date = @next_event_date.next_weekday
                         end
    end

    @next_event_date.strftime("%d.%m.%Y")
  end

  def last_week_of_the_month?
    @next_event_date.month != @next_event_date.next_week.month
  end
end
