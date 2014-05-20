class HomeController < ApplicationController



  def index


  	@number_of_points = 60 * 60 * 24 / Setting.where("key=?","check_frequency").first.value.to_i
  	#number_of_points = 3001 if number_of_points > 1000

	@temperatures = Temperature.where("sensor_id=1").order("created_at desc").limit(@number_of_points).reverse
	@temperatures2 = Temperature.where("sensor_id=2").order("created_at desc").limit(@number_of_points).reverse
	@temperatures3 = Temperature.where("sensor_id=3").order("created_at desc").limit(@number_of_points).reverse
	@temperatures4 = Temperature.where("sensor_id=4").order("created_at desc").limit(@number_of_points).reverse
	@temperatures5 = Temperature.where("sensor_id=5").order("created_at desc").limit(@number_of_points).reverse
	@sensors = Sensor.all





  end


def latest
	
	@temperature = Temperature.where("sensor_id=1").order("created_at desc").limit(1).last
	@temperature2 = Temperature.where("sensor_id=2").order("created_at desc").limit(1).last
	@temperature3 = Temperature.where("sensor_id=3").order("created_at desc").limit(1).last
	@temperature4 = Temperature.where("sensor_id=4").order("created_at desc").limit(1).last
	@temperature5 = Temperature.where("sensor_id=5").order("created_at desc").limit(1).last
	@sensors = Sensor.all






	render :json => {
		sensor1: {x: @temperature.created_at.to_i*1000,  y: ("%.1f" % (@temperature.value*@sensors.select{|s| s.id==1}.first.calibration/100)).to_f},
		sensor2: {x: @temperature2.created_at.to_i*1000, y: ("%.1f" % (@temperature2.value*@sensors.select{|s| s.id==2}.first.calibration/100)).to_f},
		sensor3: {x: @temperature3.created_at.to_i*1000, y: ("%.1f" % (@temperature3.value*@sensors.select{|s| s.id==3}.first.calibration/100)).to_f},
		sensor4: {x: @temperature4.created_at.to_i*1000, y: ("%.1f" % (@temperature4.value*@sensors.select{|s| s.id==4}.first.calibration/100)).to_f},
		sensor5: {x: @temperature5.created_at.to_i*1000, y: ("%.1f" % (@temperature5.value*@sensors.select{|s| s.id==5}.first.calibration/100)).to_f},
	}
end

end
	