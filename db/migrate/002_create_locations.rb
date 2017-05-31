class CreateLocations < ActiveRecord::Migration

  def change
    create_table :locations do |t|
      t.integer :viewer_id
      t.integer :project_id
      t.string :name
    end
  end
end
