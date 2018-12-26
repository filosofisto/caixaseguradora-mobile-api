class RecreateCoverageNameAndDescription < ActiveRecord::Migration[5.2]
  def change
    remove_column :coverages, :name
    remove_column :coverages, :description
    add_column :coverages, :name, :string, :limit => 100
    add_column :coverages, :description, :string, :limit => 500
  end
end
