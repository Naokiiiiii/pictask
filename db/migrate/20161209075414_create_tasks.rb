class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
        t.string      :trade
        t.string      :goods
        t.string      :name
        t.string      :where
        t.string      :when
        t.integer     :price
        t.text        :about
        t.timestamps
        rename_column :tasks,:Goods, :goods
end
    end
  end
