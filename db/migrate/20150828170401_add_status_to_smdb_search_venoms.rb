class AddStatusToSmdbSearchVenoms < ActiveRecord::Migration
  def change
    add_column :smdb_search_venoms, :status, :boolean
  end
end
