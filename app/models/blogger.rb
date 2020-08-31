class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    #Bloggers should have unique names and ages above 0, and their bio should be over 30 characters long.
    validates :name, uniqueness: true
    validates :age, numericality: {greater_than: 0}
    validates :bio, length: {minimum: 30}

    def likes_total
        total = 0 
        self.posts.each do |post|
            total += post.likes
        end
        total
        # go into Post
        # find every post made by this blogger
        # sum all likes from post
    end

    #A link to that blogger's featured post (the post with the most likes)
    def featured_post
        self.posts.max_by do |post|
            post.likes
        end
    end

end
