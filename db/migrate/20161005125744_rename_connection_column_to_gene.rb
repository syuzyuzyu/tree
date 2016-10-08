class RenameConnectionColumnToGene < ActiveRecord::Migration
  def change
    rename_column :genes, :connection_id, :bond_id
  end
end
