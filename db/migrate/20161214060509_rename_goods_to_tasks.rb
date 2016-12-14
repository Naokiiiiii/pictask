class RenameGoodsToTasks < ActiveRecord::Migration
  def change
    rename_column :tasks,:Where, :where
    rename_column :tasks,:When, :when
    rename_column :tasks,:Price, :price
  end
end
