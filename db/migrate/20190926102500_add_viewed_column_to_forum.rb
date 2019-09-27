class AddViewedColumnToForum < ActiveRecord::Migration[6.0]
  def change
    add_column :forums, :viewed, :integer
  end
end
