class Post < ApplicationRecord
    belongs_to :destination
    belongs_to :blogger

    validates_length_of :content, minimum: 100
    validates_presence_of :title, :content

end
# {:title, :content, :blogger_id, :destination_id, likes: 0}