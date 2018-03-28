class Message < ApplicationRecord
	REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email,presence: true,format:{ with: REGEX }
	validates :name,presence: true
	validates :content,presence: true
end
