class CreateGenes < ActiveRecord::Migration
  def change
    create_table :genes do |t|
      t.references :person, index: true
      t.references :connection, index: true
      t.string :type

      t.timestamps null: false
      t.index [:person_id, :connection_id , :type], unique: true
    end
  end
end
