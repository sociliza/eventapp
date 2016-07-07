# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

plans = [
	["Small", 1, 10, 20, 5],
	["Medium", 5, 50, 50, 10],
	["Large", 10, 100, 50, 50]
]

plans.each do |name, events, tables, storage, price|
	Plan.find_or_create_by(name: name, events: events,
		tables: tables, storage: storage, price: price)
end

10.times do |n|
  name = Faker::Company.name
  Category.create!(name: name)
end

User.create!(name:  "Phumzani",
             email: "majorars@gmail.com",
             password:              "majorars",
             password_confirmation: "majorars"
             )

99.times do |n|
  name  = Faker::Name.name
  fname = Faker::Name.first_name
  lname = Faker::Name.last_name
  email = Faker::Internet.free_email
  image = Faker::Avatar.image
  contact = Faker::PhoneNumber.phone_number
  password = "password"
  sentences = Faker::Lorem.sentence
  sentences1 = Faker::Lorem.sentence(20)
  street = Faker::Address.street_address
  city = Faker::Address.city
  state = Faker::Address.state
  country = Faker::Address.country
  zipcode = Faker::Address.zip
  date = Faker::Date.between(50.years.ago, Date.today)
  user = User.create!(name: name,
              email: email,
              password:              password,
              password_confirmation: password,
    )

  user.create_profile(
    :first_name => fname,
    :last_name => lname,
:date_of_birth => date,
:contact_number => contact,
:interest => sentences1,
:favourite_quote => sentences1,
 :about_me => sentences1,
:image => image,
)
  user.create_place(
              title: sentences,
              street: street,
              city: city,
              state: state,
              country: country,
              zipcode: zipcode,
              )
end


50.times do |n|
  if n > 9
    n = 0
  end
  if n < 0
    n = 1
  end
  name = Faker::Company.name
  email = Faker::Internet.email
  password = "password"
  image = Faker::Avatar.image
  t = Faker::Lorem.sentences
  d = Faker::Lorem.sentences(30)
  s = Faker::Date.between(Date.today, 1.year.from_now)
  e = Faker::Date.between(s, 1.year.from_now)
  c = Category.find(n+1)
    street = Faker::Address.street_address
  city = Faker::Address.city
  state = Faker::Address.state
  country = Faker::Address.country
  zipcode = Faker::Address.zip
  bussiness = Business.create!(company_name: name,
              email: email,
              password:              password,
              password_confirmation: password,
    )
  event = bussiness.events.create(title: t, start_date: s, end_date: e, category: c, description: d, image: image)
  event.create_place(
              title: t,
              street: street,
              city: city,
              state: state,
              country: country,
              zipcode: zipcode,
              )
end