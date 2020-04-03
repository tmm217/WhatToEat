task(:generate_cuisines => :environment) do
  require "faker"

  20.times do
    c = Cuisine.new
    c.title = Faker::Restaurant.type
    c.image = Faker::LoremFlickr.image

    c.save
  end
end