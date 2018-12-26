class ChangeCoverageNameAndDescriptionSize < ActiveRecord::Migration[5.2]
  def change
    change_column :coverages, :name, :string, :limit => 100
    change_column :coverages, :name, :string, :limit => 500
  end
end
