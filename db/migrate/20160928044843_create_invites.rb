class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.references :user, index: true
      t.references :person, index: true

      t.timestamps null: false
      t.index [:user_id, :person_id], unique: true
    end
  end
end
