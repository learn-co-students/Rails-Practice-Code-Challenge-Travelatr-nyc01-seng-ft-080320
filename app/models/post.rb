class Post < ApplicationRecord
    belongs_to :blogger
    belongs_to :destination

    validates :content, length: { maximum: 100 }
    validates :title, presence: true
end
