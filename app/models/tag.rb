class Tag < ApplicationRecord
	belongs_to :user
	has_many :posts,dependent: :destroy
	validates :name, presence: true
end
