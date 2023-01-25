# frozen_string_literal: true

# Returns true on weekdays from 6 to 21 and on weekend from 9 to 21 in the Moscow timezone
# otherwize returns false

class IsCurrentTimeWorkingInteractor < ActiveInteraction::Base
  def execute
    current_time = Time.now.utc.in_time_zone('Moscow')

    hour = current_time.hour
    is_weekend = current_time.saturday? || current_time.sunday?

    workday_start = is_weekend ? 9 : 6
    workday_end = 21

    return true if hour >= workday_start && hour < workday_end

    false
  end
end
