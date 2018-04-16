class CreateComments < ActiveRecord::Migration[5.1]
  def up
    create_table :comments do |t|
      t.text :body
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :comments
  end
end
