class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :comment
      t.references :user
      t.references :forum

      t.timestamps
    end
  end
end
