class CreateForums < ActiveRecord::Migration[6.0]
  def change
    create_table :forums do |t|
      t.string :title
      t.text :body
      t.string :avatar
      t.references :user

      t.timestamps
    end
  end
end
