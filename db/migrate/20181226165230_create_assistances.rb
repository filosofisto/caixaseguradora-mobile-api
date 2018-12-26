class CreateAssistances < ActiveRecord::Migration[5.2]
  def change
    create_table :assistances do |t|
      t.string :name, null: false, limit: 100
      t.string :description, null: false, limit: 500
      t.integer :limit_use
      t.boolean :included

      t.timestamps
    end
  end
end
