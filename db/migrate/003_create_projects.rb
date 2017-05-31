class CreateProjects <ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :address
      t.string :description
      t.string :city
    end
  end

end
