class HomeController < ApplicationController
  def index


  	@number_of_points = 60 * 60 * 24 / Setting.where("key=?","check_frequency").first.value.to_i
  	#number_of_points = 3001 if number_of_points > 1000

	@temperatures = Temperature.order("created_at desc").limit(@number_of_points).reverse






  end


def latest
	
	@temperature = Temperature.last

	render :json => {x: @temperature.created_at.to_i*1000 , y: @temperature.value}


end

end
	