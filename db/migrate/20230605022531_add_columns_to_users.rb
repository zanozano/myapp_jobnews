class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |t|
      t.string :name, default: ""
      t.boolean :admin, null: false, default: false
    end
  end
end
