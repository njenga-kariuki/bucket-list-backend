class AddAvgMontlyTempsToDestination < ActiveRecord::Migration[5.1]
  def change

    add_column :destinations, :avg_monthly_temperature, :string, array:true, :default=> []
  end
end
