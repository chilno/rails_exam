class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :users, :eamil, :email
  end
end
