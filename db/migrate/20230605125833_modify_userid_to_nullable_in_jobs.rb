class ModifyUseridToNullableInJobs < ActiveRecord::Migration[7.0]
  def change
    change_column :jobs, :user_id, :bigint, null: true
  end
end
