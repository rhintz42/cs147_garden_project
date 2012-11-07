class GardenWatering < ActiveRecord::Base
  belongs_to :garden
  attr_accessible :watering_amount,
                  :watering_time,
                  :garden_id

def watering_time=(time)
    if time.class == String then
      self[:watering_time] = Time.strptime(time, "%Y-%m-%d").to_f
    else
      self[:watering_time] = time
    end
  end

  def watering_time_timestamp
    return Time.at(self[:watering_time])
  end
end
