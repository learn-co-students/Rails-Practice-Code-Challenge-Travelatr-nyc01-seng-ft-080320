class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def most_recent_five_posts
        self.posts.sort_by do |post|
            post.created_at
        end.reverse.take(5)
        #["post1","post2","post3","post4","post5"]
    end

    def most_liked_post
        self.posts.reduce do |post_with_most, post|
            post_with_most.likes > post.likes ? post_with_most : post
        end
    end

    def average_age_of_bloggers
        if self.bloggers.size == 0
            return 0
        end
        self.bloggers.uniq.reduce(0.0) do |sum, blogger|
            sum + blogger.age
        end/self.bloggers.uniq.size
    end

end
