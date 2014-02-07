class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.integer :publication_id
      t.string :file_uid

      t.timestamps
    end
  end
end
