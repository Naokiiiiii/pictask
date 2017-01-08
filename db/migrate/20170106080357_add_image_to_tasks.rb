class AddImageToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :image, :text
  end
end
