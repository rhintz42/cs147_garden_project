class LoadUsers < ActiveRecord::Migration
  def up
    
    down

    user1 = User.new(
      :address_latitude   => 0.5,
      :address_longitude  => 0.5,
      :address_street     => "POBox 11427",
      :address_city       => "Stanford",
      :address_state      => "California",
      :address_zipcode    => 94309,
      :authorization      => "5",
      :email              => "rhintz42@stanford.edu",
      :gender             => "true",
      :last_login         => "12341234",
      :name_first         => "Robert",
      :name_last          => "Hintz",
      :name_middle        => "Michael",
      :password_digest    => "6e2ab540b9897ea28ddd7740981731cc0a0453ba",
      :points             => 12341234,
      :salt               => 37,
      :time_zone          => "PDT",
      :username           => "a"
    )

    user1.save(:validate => false)
  end

  def down
    User.delete_all
  end
end
