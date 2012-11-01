class LoadPersonalPlants < ActiveRecord::Migration
  def up
    down
    personal_plant_1 = PersonalPlant.new(
      #:hardiness_zone                       => 0.5,
      :name_personalized                    => "RoflCopter",
      :plant_id                             => 1,
      :garden_id                            => 1,
      #:rating_ease_care                     => 0.5,
      #:rating_ease_pruning                  => 0.5,
      #:rating_ease_watering                 => 0.5,
      #:rating_num                           => 3,
      #:sun_exposure                         => 75,
      :user_id                              => 1,
      #:watering_frequency                   => 0.5
    )

    personal_plant_1.save()
  end

  def down
    PersonalPlant.delete_all
  end
end
