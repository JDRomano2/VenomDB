class AddStatusToManualVenoms < ActiveRecord::Migration
  def change
    add_column :manual_venoms, :status, :boolean
  end
end
