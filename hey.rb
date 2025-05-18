 rails g model Location city:string country:string
rails g model User name:string phone_number:string
rails g model UserLocation user:references location:references
rails g model Photo image_url:string caption:string user:references
class User < ApplicationRecord
  has_many :user_locations
  has_many :locations, through: :user_locations
  has_many :photos
end

class Location < ApplicationRecord
  has_many :user_locations
  has_many :users, through: :user_locations
end

class UserLocation < ApplicationRecord
  belongs_to :user
  belongs_to :location
end

class Photo < ApplicationRecord
  belongs_to :user
end
# Create Locations
location1 = Location.create(city: "Paris", country: "France")
location2 = Location.create(city: "New York", country: "USA")
location3 = Location.create(city: "Tokyo", country: "Japan")

# Create Users
user1 = User.create(name: "Alex", phone_number: "1234567890")
user2 = User.create(name: "Jamie", phone_number: "0987654321")
user3 = User.create(name: "Jordan", phone_number: "5678901234")

# Assign Multiple Locations to Users
UserLocation.create(user: user1, location: location1)
UserLocation.create(user: user1, location: location2)
UserLocation.create(user: user2, location: location3)

# Create Photos
Photo.create(image_url: "https://example.com/soda.jpg", caption: "Refreshing drink!", user: user1)
Photo.create(image_url: "https://example.com/couple.jpg", caption: "A lovely moment", user: user2)
Photo.create(image_url: "https://example.com/friends.jpg", caption: "Great times together!", user: user3)
