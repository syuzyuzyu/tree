class RemoveTagFromMicropost < ActiveRecord::Migration
  def change
    remove_reference :microposts, :person, index: true, foreign_key: true
  end
end
