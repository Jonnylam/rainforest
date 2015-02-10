class User < ActiveRecord::Base
	has_secure_password

	validates :name, :email, presence: true
	validates :email, uniqueness: true 

	# validates :name_start_with_a
	has_many :reviews
	has_many :products, through: :reviews


	# private 
	# def name_starts_with_a
	# 	if name[0] != "A"
	# errors.add(:name, "Doesn't start with A")
	# 	end
	# end

end
