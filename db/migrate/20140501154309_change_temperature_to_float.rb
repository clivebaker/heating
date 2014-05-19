class ChangeTemperatureToFloat < ActiveRecord::Migration
  def change

change_column :temperatures, :value, :float 

  end
end
