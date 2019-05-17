class UpdateDestinationTempColumn < ActiveRecord::Migration[5.1]
  def change

    change_column :destinations, :avg_monthly_temperature, :string
  end
end
