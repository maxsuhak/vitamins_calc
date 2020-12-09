class CreateActivityLevels < ActiveRecord::Migration[6.0]
  def change
    create_table :activity_levels do |t|
      t.references :user
      t.integer :vitamin_c
      t.integer :vitamin_d3
      t.integer :iron

      t.timestamps
    end
  end
end
