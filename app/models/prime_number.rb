class PrimeNumber < ApplicationRecord
	has_many :prime_number_befores, dependent: :destroy
	attr_accessor :prime_elements
	validates :prime_number, uniqueness: { message: "%{value} already exists" }

	def save_prime_befores
		return prime_number_befores.destroy.all if prime_elements.nil? || prime_elements.empty?

		prime_elements.each do|prime|
			PrimeNumberBefore.create(number: prime, prime_number: self)
		end
	end
end
