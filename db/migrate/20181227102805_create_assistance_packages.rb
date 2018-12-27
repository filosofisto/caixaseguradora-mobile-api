class CreateAssistancePackages < ActiveRecord::Migration[5.2]
  def change
    create_table :assistance_packages do |t|
      t.string :name, null: false, limit: 50
      t.decimal :value, precision: 10, scale: 2

      t.timestamps
    end
  end
end
