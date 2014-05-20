class AddCalibrationOnSensors < ActiveRecord::Migration
  def change
  	add_column :sensors, :calibration, :float
  end
end
