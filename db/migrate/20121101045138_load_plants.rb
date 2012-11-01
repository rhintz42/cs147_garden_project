class LoadPlants < ActiveRecord::Migration
  def up
    down
    
    plant1 = Plant.new(
      :authorized => true,
      :description => "Very cute little plant",
      :hardiness_zone_max => 7,
      :hardiness_zone_min => 2,
      :is_houseplant      => false,
      :leeway_sun_exposure => 0.5,
      :leeway_watering_weekly_amount => 0.5,
      :name_botanical => "Rosa",
      :name_common => "Rose",
      :plant_type => "Bush",
      :rating_ease_care => 4.5,
      :rating_ease_pruning => 3.6,
      :rating_ease_watering => 4.2,
      :rating_num => 46,
      :sun_exposure => 75,
      :user_created_by => 1,
      :watering_frequency_old => 4,
      :watering_frequency_new => 15,
      :watering_weekly_amount => 3
    )
    plant1.save(:validate => false)

  plant2 = Plant.new(
      :authorized => true,
      :description => "Very cute little plant",
      :hardiness_zone_max => 7,
      :hardiness_zone_min => 2,
      :is_houseplant      => false,
      :leeway_sun_exposure => 0.5,
      :leeway_watering_weekly_amount => 0.5,
      :name_botanical => "macrophylla 'Bailmer'",
      :name_common => "Hydrangea",
      :plant_type => "Bush",
      :rating_ease_care => 4.5,
      :rating_ease_pruning => 3.6,
      :rating_ease_watering => 4.2,
      :rating_num => 46,
      :sun_exposure => 75,
      :user_created_by => 1,
      :watering_frequency_old => 4,
      :watering_frequency_new => 15,
      :watering_weekly_amount => 3
    )
    plant2.save(:validate => false)


  end

  def down
    Plant.delete_all
    
  end
end
