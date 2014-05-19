class CreateTemperatures < ActiveRecord::Migration
  def change
    create_table :temperatures do |t|
      t.decimal :value, :precision => 4, :scale => 2

      t.timestamps
    end
  end
end
