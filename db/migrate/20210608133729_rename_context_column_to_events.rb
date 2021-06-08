class RenameContextColumnToEvents < ActiveRecord::Migration[6.1]
  def change
    rename_column :events, :context, :content
  end
end
