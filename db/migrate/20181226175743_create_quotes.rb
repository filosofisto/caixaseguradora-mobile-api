class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.string :name, null: false, limit: 50
      t.string :email, limit: 50
      t.string :phone, limit: 11
      t.string :zipcode, null: false, limit: 8
      t.string :type_of_property, null: false, limit: 1
      t.boolean :gated_community, null: false
      t.boolean :main_home, null: false
      t.decimal :approximate_value, null: false, precision: 10, scale: 2
      t.boolean :insurance_with_another_insurer, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
