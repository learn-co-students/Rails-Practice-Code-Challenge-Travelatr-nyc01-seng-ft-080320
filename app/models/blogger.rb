class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

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
