class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :original
      t.string :updated
      t.integer :click_count

      t.timestamps
    end
  end
end
