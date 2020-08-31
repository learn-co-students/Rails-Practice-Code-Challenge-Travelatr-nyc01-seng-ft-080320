class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    def likes
        self.posts.sum {|post| post.likes}
    end

    def feature
        self.posts.max_by {|post| post.likes}
    end

    def top_five_destinations
        counts = Hash.new(0)
        self.destinations.each {|dest| counts[dest.name] += 1}
        five = counts.sort_by {|dest, count| count}.reverse.last(5)
        five.map {|d| d[0]}
    end



end
