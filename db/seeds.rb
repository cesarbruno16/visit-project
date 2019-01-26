# Populating db with random stuffs

# Create Admin User
admin = User.find_by_email("admin@visit-project.com") || User.create(name: "Admin User", email: "admin@visit-project.com", password: "123456", role: 1)

# Create Ordinary User
ordinary = User.find_by_email("ordinary@visit-project.com") || User.create(name: "Ordinary User", email: "ordinary@visit-project.com", password: "123456")


# Create some hotels
[
	{name: "Pernambuco's Hotel", price: 48.90, country: "BR", state: "PE", city: "Caruaru", address: "Av. Agamenon Magalhães, Maurício de Nassau, 520, Caruaru, Pernambuco, Brasil", user: admin},
	{name: "California's Hotel", price: 98.90, country: "US", state: "CA", city: "Montain View", address: "Infity Loop, Montain View, California, USA", user: admin},
	{name: "New York Hotel", price: 98.90, country: "US", state: "NY", city: "New York", address: "Fifth Avenue, 546", user: admin}
].each do |hotel|
	Hotel.where(hotel).first_or_create
end

# Create some facilities
["BREAKFEAST INCLUDED", "ALL INCLUSIVE", "WIFI", "KITCHEN"].each do |facility|
	Facility.create(name: facility, user: admin)
end

# Associating each hotel to a unique random Facility
Hotel.all.each do |hotel|
	FacilityHotel.create(hotel: hotel, facility: Facility.order("RANDOM()").limit(1).first)
end