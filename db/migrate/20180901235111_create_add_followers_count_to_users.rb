class CreateAddFollowersCountToUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :add_followers_count_to_users do |t|
      t.integer :followers_count

      t.timestamps
    end
  end
end
