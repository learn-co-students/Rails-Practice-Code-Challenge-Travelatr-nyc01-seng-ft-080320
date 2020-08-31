class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def average_age
        age = 0
        self.bloggers.each do |blogger|
          age += blogger.age 
        end
        age/self.bloggers.count
    end

    def most_liked
        self.posts.max{|a,b| a.likes <=> b.likes}
    end
end
