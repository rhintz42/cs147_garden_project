class PlantCommentsController < ApplicationController
	include MyModule
	
  # POST /plant_comments/comment/1
  # POST /plant_comments/comment/1.json
  def comment
  	if not check_logged_in then
  		return
  	end
  	
  	@plant = Plant.find(params[:id])
  	
  	
  	@plant_comment = PlantComment.new
  	
  end
  
  def post_comment
  	@plant = Plant.find(params[:id])
  	
  	user = User.find(session[:user][:id])
  	user_name = user.name_first + " " + user.name_last
  	
	@plant_comment = PlantComment.new(:user => session[:user], :plant => @plant, :body => params[:plant_comment][:body], :commenter => user_name)
	@plant_comment.save
	redirect_to(:controller => :plants, :action => :show, :id => params[:id])
  end

end
