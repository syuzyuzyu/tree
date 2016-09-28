class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :image
      t.string :first_name
      t.string :last_name
      t.date :birth_date
      t.date :dead
      t.integer :gender
      t.string :birth_place
      t.string :city
      t.string :cuntry
      t.text :summary
      t.string :occupation
      t.boolean :delete_flg

      t.timestamps null: false
    end
  end
end
