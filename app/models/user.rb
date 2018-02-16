class User < ApplicationRecord

	has_many :events
	has_many :attendances
	has_many :attended_events, :through => :attendances, :source => "event"

	validates :name, presence: true
	validates :email, presence: true

	has_secure_password
	validates :password, presence: true

end
