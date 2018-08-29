class Post < ApplicationRecord
    has_many :post_categories, dependent: :destroy
    has_many :categories, :through => :post_categories, dependent: :destroy
    belongs_to :user
    mount_uploader :picture, PictureUploader

    def self.category_with(category)
        Category.find_by_category!(category).posts
    end

    def self.category_counts
        Tag.select("categories.*, count(post_categories.category_id) as count").
        joins(:post_categories).group("post_categories.category_id")
    end

    def category_list
        categories.map(&:category).join(", ")
    end

    def category_list=(names)
        self.categories = names.split(",").map do |n|
            Category.where(category: n.strip).first_or_create!
        end
    end

    def user_with
        Post.find_by_user(user).posts
    end

end
