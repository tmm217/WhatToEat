task(:generate_dishes => :environment) do
  require "faker"

  20.times do 
    d = Dish.new
    d.name = Faker::Food.dish
    d.description = Faker::Food.description
    d.cuisine_id = rand(1..40)

    d.save
  end
end