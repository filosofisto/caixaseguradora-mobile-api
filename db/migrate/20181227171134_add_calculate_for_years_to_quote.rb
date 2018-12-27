class AddCalculateForYearsToQuote < ActiveRecord::Migration[5.2]
  def change
    add_column :quotes, :calculate_for_years, :integer
  end
end
