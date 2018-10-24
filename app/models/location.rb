class Location < ApplicationRecord
  geocoded_by :address,
    latitude: :fetched_latitude,
    longitude: :fetched_longitude
    # the below code only looks up the geocode if the 
    # address has changed from the last save
  reverse_geocoded_by :latitude, :longitude
  after_validation :geocode,
  :if => lambda{ |obj| obj.address_changed? }
end