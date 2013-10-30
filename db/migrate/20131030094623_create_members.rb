class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.references  :band
      t.string      :name
      t.timestamps
    end
  end
end
