class AddReference < ActiveRecord::Migration[7.0]
  def change
    add_reference :tools, :user, foreign_key: true
  end
end
