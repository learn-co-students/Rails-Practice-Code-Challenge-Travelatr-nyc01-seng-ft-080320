class Destination < ApplicationRecord
    has_many :posts 
    has_many :bloggers, through: :posts

    def feature
        self.posts.max_by {|post| post.likes}
    end

    def last_five_posts
        self.posts.last(5)
    end

    def average_blogger_age
        total_age = self.bloggers.uniq.sum {|blogger| blogger.age}
        total_bloggers = self.bloggers.uniq.count
        avg = total_age / total_bloggers
        avg
    end

end
