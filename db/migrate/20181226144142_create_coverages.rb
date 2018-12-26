class CreateCoverages < ActiveRecord::Migration[5.2]
  def change
    create_table :coverages do |t|
      t.string :name, null: false, limit: 30
      t.string :description, null: false, limite: 255
      t.boolean :fix, null: false, default: false
      t.decimal :value, null: false, precision: 10, scale: 2
      t.decimal :franchise, null: false, precision: 10, scale: 2

      t.timestamps
    end
  end
end
