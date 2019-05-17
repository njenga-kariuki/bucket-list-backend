class V2UpdateDestinationAvgTemp < ActiveRecord::Migration[5.1]
  def change

    remove_column :destinations, :avg_monthly_temperature
    
    add_column :destinations, :avg_monthly_temperature, :string
  end
end
