class AddUserIdToTasks < ActiveRecord::Migration[5.1]
  def changed
    add_column :tasks,:user_id,:integer
  end
end
