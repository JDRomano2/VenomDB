class CreateManualVenoms < ActiveRecord::Migration
  def change
    create_table :manual_venoms do |t|
      t.text :venom
      t.text :effect
      t.text :pmid

      t.timestamps null: false
    end
  end
end
