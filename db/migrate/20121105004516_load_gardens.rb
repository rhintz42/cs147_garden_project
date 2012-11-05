class LoadGardens < ActiveRecord::Migration
  def up
		garden1 = Garden.new(
			:name		=> "Robert's Garden",
			:city		=> "Palo Alto",
			:state	=> "California",
			:theme	=> "Pirates",
			:user_id => 1
		)

		garden1.save
  end

  def down
		Garden.delete_all
  end
end
