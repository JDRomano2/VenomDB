class CreateJdrAutoparseVenoms < ActiveRecord::Migration
  def change
    create_table :jdr_autoparse_venoms do |t|
      t.string :venom
      t.string :effect
      t.string :pmid

      t.timestamps null: false
    end
  end
end
