class DropQIndex < ActiveRecord::Migration[5.2]
  def change
    remove_index :quotes, name: 'q_index'
    add_index :quotes, :name, unique: false, name: 'q_index'
  end
end
