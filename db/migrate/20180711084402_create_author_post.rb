class CreateAuthorPost < ActiveRecord::Migration[5.2]
  def change
    create_table :authorposts do |t|
      t.integer :author_id, index: true
      t.integer :post_id, index: true
    end
  end
end
