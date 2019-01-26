class User < ApplicationRecord
  	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
	has_many :hotels
	has_many :facilities

	enum role: [:ordinary, :admin]
end
