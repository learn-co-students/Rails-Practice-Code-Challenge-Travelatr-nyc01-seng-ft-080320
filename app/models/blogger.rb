class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    def likes
        self.posts.sum {|post| post.likes}
    end

    def feature
        self.posts.max_by {|post| post.likes}
    end


end
