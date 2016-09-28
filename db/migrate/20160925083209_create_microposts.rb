class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.references :person, index: true, foreign_key: true
      t.text :content
      t.string :image
      t.boolean :delete_flg
      t.string :title

      t.timestamps null: false
      t.index [:person_id, :created_at]
    end
  end
end
