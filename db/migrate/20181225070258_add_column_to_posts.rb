class AddColumnToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column    :posts, :post_text, :string
    add_reference :posts, :user, foreign_key: true
  end
end
