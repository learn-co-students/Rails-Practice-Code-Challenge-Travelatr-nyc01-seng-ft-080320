class Post < ApplicationRecord
    belongs_to :blogger
    belongs_to :destination

    validates :content, length: {maximum: 100}


    def like_post 
            likes = self.likes + 1
            self.update(likes: likes)
            self
    end 

    
end
