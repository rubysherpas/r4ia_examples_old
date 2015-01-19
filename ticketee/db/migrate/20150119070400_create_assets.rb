class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :asset
      t.references :ticket, index: true

      t.timestamps null: false
    end
    add_foreign_key :assets, :tickets
  end
end
