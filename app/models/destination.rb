class Destination < ActiveRecord::Base
	validates :name, presence: true
	has_many :favorites
	has_many :users, through: :favorites
end
