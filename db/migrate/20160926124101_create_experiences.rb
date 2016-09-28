class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.references :person, index: true
      t.references :micropost, index: true

      t.timestamps null: false
      t.index [:person_id, :micropost_id], unique: true
    end
  end
end
