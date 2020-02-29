class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.integer :likes
      t.integer :user_id
      t.integer :activity_id
    end
  end
end
