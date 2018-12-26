class QuoteCategoryPropertyJointable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :quotes, :category_properties
  end
end
