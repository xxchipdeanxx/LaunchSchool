require 'date'

class Meetup
  attr_reader :start_date, :collected_days

  def initialize(year,month)
    @start_date = Date.civil(year,month)
  end

  def day(weekday, qualifier)
    collect_days(weekday)
    case qualifier.downcase
    when 'first' then @collected_days.first
    when 'second' then @collected_days[1]
    when 'third' then @collected_days[2]
    when 'fourth' then @collected_days[3]
    when 'fifth' then @collected_days[4]
    when 'last' then @collected_days.last
    when 'teenth' then select_teenth
    end
  end

  private

  def collect_days(weekday)
    @collected_days = []
    symbol = (weekday.downcase << '?').to_sym
    day = start_date.dup

    while day.month == start_date.month
      @collected_days << day if day.send(symbol)
      day = day.next_day
    end
  end

  def select_teenth
    range = (13..19)
    @collected_days.select {|date| range.cover?(date.day)}.first
  end
end

class MeetupLS
  SCHEDULE_START_DAY = {
    'first' => 1,
    'second' => 8,
    'third' => 15,
    'fourth' => 22,
    'fifth' => 29,
    'teenth' => 13,
    'last' => nil
  }.freeze

  def initialize(year, month)
    @year = year
    @month = month
    @days_in_month = Date.civil(@year, @month, -1).day
  end

  def day(weekday, schedule)
    weekday = weekday.downcase
    schedule = schedule.downcase

    first_possible_day = first_day_to_search(schedule)
    last_possible_day = [first_possible_day + 6, @days_in_month].min

    (first_possible_day..last_possible_day).detect do |day|
      date = Date.civil(@year, @month, day)
      break date if day_of_week_is?(date, weekday)
    end
  end

  private

  def first_day_to_search(schedule)
    SCHEDULE_START_DAY[schedule] || (@days_in_month - 6)
  end

  def day_of_week_is?(date, weekday) # rubocop:disable Metrics/CyclomaticComplexity
    case weekday
    when 'monday'    then date.monday?
    when 'tuesday'   then date.tuesday?
    when 'wednesday' then date.wednesday?
    when 'thursday'  then date.thursday?
    when 'friday'    then date.friday?
    when 'saturday'  then date.saturday?
    when 'sunday'    then date.sunday?
    end
  end
end
#Because the LS implementation of this problem generates a MAX of a weeks worth
# of Dates -- their implementation is MUCH faster than my own.

#I chose to create all the possible days of the week that fit the #day argument
#because it was easier to implement in my mind at the time, but needless to say
#that it is terribly slow considering that it will always generate an entire month's worth
#of date objects in order to implement

#In short -- it fufills the test requirements, but not very quicky. Had their been a test_run_time
#test to see if implementation could be accomplished in LESS THAN (2.0e-05) seconds.
  #My  test would have consistently failed