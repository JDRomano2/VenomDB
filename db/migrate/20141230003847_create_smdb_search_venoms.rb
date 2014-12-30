class CreateSmdbSearchVenoms < ActiveRecord::Migration
  def change
    create_table :smdb_search_venoms do |t|
      t.string :compound
      t.string :predicate
      t.string :object
      t.string :pmid

      t.timestamps null: false
    end
  end
end
