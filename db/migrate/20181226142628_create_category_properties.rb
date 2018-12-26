class CreateCategoryProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :category_properties do |t|
      t.string :name, :length => 50

      t.timestamps
    end
  end
end
