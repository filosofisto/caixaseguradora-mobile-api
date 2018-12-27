class QuoteAssistencePackagesJointable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :quotes, :assistance_packages
    add_index :assistance_packages_quotes, [:assistance_package_id, :quote_id], unique: true, name: 'apq_index'
  end
end
