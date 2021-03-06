class User < ApplicationRecord
    before_save { self.email = email.downcase }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: { minimum: 6 }
    has_secure_password
    has_many :posts
    has_many :likes, dependent: :destroy
    has_many :active_relationships,  class_name:  "Follow",
                                   foreign_key: "follower_id",
                                   dependent:   :destroy
    has_many :passive_relationships, class_name:  "Follow",
                                  foreign_key: "followed_id",
                                  dependent:   :destroy
    has_many :following, through: :active_relationships,  source: :followed
    has_many :followers, through: :passive_relationships, source: :follower

    mount_uploader :picture, PictureUploader

    def follow(other_user)
        active_relationships.create(followed_id: other_user.id)
    end

    def unfollow(other_user)
        active_relationships.find_by(followed_id: other_user.id).destroy
    end

    def following?(other_user)
        following.include?(other_user)
    end

end
