class Blogger < ApplicationRecord
    has_many :destinations, through: :posts
    has_many :posts

    validates :age, numericality: {only_integer: true, greater_than: 0}
    validates :name, uniqueness: true
    validates :bio, length: {minimum: 30}

    def all_likes
        self.posts.sum{|e|e.likes}
    end
    
    def featured
        self.posts.max_by{|e|e.likes}
    end 
    
end
