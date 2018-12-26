class ChangeCoverageNameSize < ActiveRecord::Migration[5.2]
  def change
    change_column :coverages, :name, :string, :limit => 100
  end
end
