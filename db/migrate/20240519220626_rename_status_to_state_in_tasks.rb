class RenameStatusToStateInTasks < ActiveRecord::Migration[7.1]
  def change
    rename_column :tasks, :status, :state
  end
end
