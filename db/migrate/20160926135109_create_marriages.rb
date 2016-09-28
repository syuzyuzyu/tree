class CreateMarriages < ActiveRecord::Migration
  def change
    create_table :marriages do |t|
      t.references :person, index: true
      t.references :spouse, index: true
      t.date :start
      t.date :end

      t.timestamps null: false
      t.index [:person_id, :spouse_id], unique: true
    end
  end
end
