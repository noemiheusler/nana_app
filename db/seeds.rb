# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Seed started"


  User.create!(
      firstname: "Noemi",
      lastname: "Heusler",
      email: "blub@gmail.com",
      password: "123456",
      address: "Gehrenholz 1a, 8055, Zürich, Schweiz",
      motto: "Motto Bla",
      description: "Description Bla"
    )

5.times {
Event.create!(
    title: "Event Title",
    description: "Event description",
    max_participants: 5,
    start_date: (Date.today + 1),
    end_date: (Date.today + 2),
    category: "public",
    user_id: User.all.sample.id
  )
}


puts  "Seed ended"
