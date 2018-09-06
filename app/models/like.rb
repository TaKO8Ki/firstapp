class Like < ApplicationRecord
    belongs_to :post, counter_cache: :likes_count
    belongs_to :user
    validates :post_id, presence: true
    validates :user_id, presence: true

    def create_good(user)
        likes.create(user_id: user.id)
    end

    def destroy_good(user)
        likes.find_by(user_id: user.id).destroy
    end

end
