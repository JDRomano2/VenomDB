class AddStatusToJdrAutoparseVenoms < ActiveRecord::Migration
  def change
    add_column :jdr_autoparse_venoms, :status, :boolean
  end
end
