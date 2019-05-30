class UpdateUserPersonalAttributes < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :preferred_activities, :string, array:true, :default=>[]
    add_column :users, :preferred_accomodations, :string, array:true, :default=>[]
  end
end
