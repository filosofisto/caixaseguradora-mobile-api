class QuoteAssistanceJointable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :quotes, :assistances
  end
end
