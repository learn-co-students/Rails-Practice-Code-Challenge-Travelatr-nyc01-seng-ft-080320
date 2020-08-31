class Destination < ApplicationRecord
has_many :posts
has_many :bloggers, through: :posts


    def recent_posts
        self.posts.reverse
        most_recent = []
        index = 0
        if self.posts.count > 0
            5.times do
                most_recent << self.posts[index]
            end
            index += 1
        end
        most_recent
    end

    def featured_post
        self.posts.max_by do |post|
            post.likes
        end
    end

    def average_age
        unique = self.bloggers.uniq
        sum = unique.sum do |blogger|
            blogger.age
        end
        sum/unique.length
    end

end 

     
