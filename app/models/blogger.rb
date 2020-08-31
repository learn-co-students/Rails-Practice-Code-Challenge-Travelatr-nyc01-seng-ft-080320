class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, uniqueness: true
    validates :age, numericality: {greater_than: 0}
    validates_length_of :bio, minimum: 30

    def total_likes
        self.posts.reduce(0) do |sum, post|
            sum + post.likes
        end
    end

    def featured_post
        self.posts.reduce do |post1, post2|
            post1.likes > post2.likes ? post1 : post2
        end
    end
    
    def top_five_destinations
        self.destinations.sort_by do |destination|
            destination.posts.count
        end.take(5)
    end 
end
