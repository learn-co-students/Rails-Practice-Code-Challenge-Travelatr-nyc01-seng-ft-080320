class Destination < ApplicationRecord
    has_many :bloggers, through: :posts
    has_many :posts


    def all_bloggers
       all_bloggers =  self.posts.map do |post|
            post.blogger
        end
        all_bloggers.uniq!
    end

    def average_age
        if all_bloggers.kind_of?(Array)
            blogger_age = self.all_bloggers.map do |blogger|
            blogger.age 
            end
            blogger_age.inject{ |sum, el| sum + el }.to_f / blogger_age.size).to_i
        elsif all_bloggers.kind_of?(Integer) 
            all_bloggers.age
        end
    end

    def last_five
        self.posts.last(5)  
    end 
end
