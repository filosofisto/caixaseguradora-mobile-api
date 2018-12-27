class Indexes < ActiveRecord::Migration[5.2]
  def change
    add_index :assistance_packages, :name, unique: true, name: 'ap_index'
    add_index :assistance_packages_assistances, [:assistance_package_id, :assistance_id], unique: true, name: 'apa_index'
    add_index :assistances, :name, unique: true, name: 'a_index'
    add_index :assistances_quotes, [:assistance_id, :quote_id], unique: true, name: 'aq_index'
    add_index :category_properties, :name, unique: true, name: 'cp_index'
    add_index :category_properties_quotes, [:category_property_id, :quote_id], unique: true, name: 'cpq_index'
    add_index :coverages, :name, unique: true, name: 'c_index'
    add_index :coverages_quotes, [:coverage_id, :quote_id], unique: true, name: 'cq_index'
    add_index :quotes, :name, unique: true, name: 'q_index'
    add_index :users, :email, unique: true, name: 'u_index'
  end
end
