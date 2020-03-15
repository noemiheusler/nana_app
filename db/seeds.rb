require 'date'
require "open-uri"

puts "Started seed!"

Answer.destroy_all
Event.destroy_all
Kid.destroy_all
Message.destroy_all
OnboardingQuestion.destroy_all
Conversation.destroy_all
Participation.destroy_all
Invitation.destroy_all
Question.destroy_all
User.destroy_all

Question.create(question: "what do you like more?", option_a: "SECOND HAND", option_b: "NEW")
Question.create(question: "what do you like more?", option_a: "RELAXING", option_b: "BEING ACTIVE")
Question.create(question: "what do you like more?", option_a: "WOODEN TOYS", option_b: "PLASTIC TOYS")

user_1 = User.create!(email: "anna.hill@gmail.com", password: "password", firstname: "Anna", lastname: "Hill", address: "Heinrichstrasse 269 8005 Zürich", motto: "Work hard, play hard!", description: "I love my kids, going for a walk and playing with my dog Sammy.")
user_2 = User.create!(email: "t.gardner@gmail.com", password: "password", firstname: "Tomas", lastname: "Gardner", address: "Kronenstrasse 42 8006 Zürich", motto: "Carpe diem <3", description: "I am a single dad and looking for other parents to support each other.")
user_3 = User.create!(email: "jules_travels@gmail.com", password: "password", firstname: "Julia", lastname: "Förster", address: "Badenerstrasse 500 8048 Zürich", motto: "You cannot buy happiness, but flights!", description: "I travel the world with my familiy.")
user_4 = User.create!(email: "sabine.mueller@gmail.com", password: "password", firstname: "Sabine", lastname: "Müller", address: "Wuhrstrasse 12 8003 Zürich", motto: "Cannot stop, will not stop!", description: "Working full time as a single mom is hard but I love my life.")
user_5 = User.create!(email: "petra.jahn@gmail.com", password: "password", firstname: "Petra", lastname: "Jahn", address: "Mythenquai 95 8002 Zürich", motto: "Keep smiling :)", description: "Positive thinker! Vegan Minimalist with zero waste lifestyle")
user_6 = User.create!(email: "fetzer.maria@gmail.com", password: "password", firstname: "Maria", lastname: "Fetzer", address: "Mythenquai 333 8038 Zürich", motto: "Wine is always a good solution", description: "Owning a brasserie for the last 10 years.")
user_7 = User.create!(email: "jan1982@gmail.com", password: "password", firstname: "Jan", lastname: "Henkel", address: "Etzelstrasse 3 8038 Zürich", motto: "Züri 4-evaaa!", description: "Hiking is one of my most favourite activities besides being a father.")
user_8 = User.create!(email: "steffi_loves_cake@gmail.com", password: "password", firstname: "Stefanie", lastname: "Becker", address: "Studackerstrasse 1 8038 Zürich", motto: "Cake rulezzz!", description: "Love baking almost as much as my family.")
user_9 = User.create!(email: "caro.maier@gmail.com", password: "password", firstname: "Caroline", lastname: "Maier", address: "Falkenstrasse 1 8008 Zürich, Schweiz", motto: "<3 Chappucchino <3", description: "Having a cappucchino and relaxing while reading a book is my perfect day.")
user_10 = User.create!(email: "jessy.manner@gmail.com", password: "password", firstname: "Jessica", lastname: "Manner", address: "Mainaustrasse 23 8008 Zürich", motto: "In love with life", description: "Positive thinker with a lot of energy :)")

User.all.each do |user|
  Question.all.each do |question|
    Answer.create(user:user, question:question, answer:[true, false].sample)
  end
end

user_2.friend_request(user_1)
user_3.friend_request(user_1)
user_4.friend_request(user_1)
user_5.friend_request(user_1)
user_6.friend_request(user_1)
user_7.friend_request(user_1)
user_1.friend_request(user_8)
user_1.friend_request(user_9)
user_1.friend_request(user_10)
user_1.accept_request(user_2)
user_1.accept_request(user_3)
user_1.accept_request(user_4)

kid_1 = Kid.create!(birthday: "10.03.2017" , user_id: (User.all.last.id - 9))
kid_2 = Kid.create!(birthday: "29.05.2010" , user_id: (User.all.last.id - 9))
kid_3 = Kid.create!(birthday: "06.08.2019" , user_id: (User.all.last.id - 9))
kid_4 = Kid.create!(birthday: "17.02.2019" , user_id: (User.all.last.id - 9))
kid_5 = Kid.create!(birthday: "29.01.2018" , user_id: (User.all.last.id - 8))
kid_6 = Kid.create!(birthday: "18.09.2013" , user_id: (User.all.last.id - 8))
kid_7 = Kid.create!(birthday: "11.11.2015" , user_id: (User.all.last.id - 7))
kid_8 = Kid.create!(birthday: "30.11.2016" , user_id: (User.all.last.id - 7))
kid_9 = Kid.create!(birthday: "13.12.2012" , user_id: (User.all.last.id - 6))
kid_10 = Kid.create!(birthday: "18.10.2016" , user_id: (User.all.last.id - 5))
kid_11 = Kid.create!(birthday: "18.10.2016" , user_id: (User.all.last.id - 5))
kid_12 = Kid.create!(birthday: "26.01.2020" , user_id: (User.all.last.id - 5))
kid_13 = Kid.create!(birthday: "27.06.2018" , user_id: (User.all.last.id - 4))
kid_14 = Kid.create!(birthday: "22.04.2014" , user_id: (User.all.last.id - 4))
kid_15 = Kid.create!(birthday: "27.12.2013" , user_id: (User.all.last.id - 3))
kid_16 = Kid.create!(birthday: "19.03.2012" , user_id: (User.all.last.id - 1))

event_1 = Event.create!(title: "Cappuchino Meet-up", location: "Kronenstrasse 42 8006 Zürich", description: "Have a chat and some cappucchinos in this new Café", max_participants: "5", start_date: "10.02.2020 15:00", end_date: "10.02.2020 18:00", category: "Private", user_id: (User.all.last.id - 9))
event_2 = Event.create!(title: "Playground Meet-up", location: "Kronenstrasse 42 8006 Zürich", description: "Have a chat and some cappucchinos in this new Café", max_participants: "5", start_date: "15.05.2020 14:00", end_date: "15.05.2020 17:00", category: "Public", user_id: (User.all.last.id - 9))
event_3 = Event.create!(title: "Water park tomorrow", location: "Kronenstrasse 42 8006 Zürich", description: "Have a chat and some cappucchinos in this new Café", max_participants: "5", start_date: "03.01.2020 10:00", end_date: "03.01.2020 12:00", category: "Public", user_id: (User.all.last.id - 9))
event_4 = Event.create!(title: "Diaper workshop", location: "Kronenstrasse 42 8006 Zürich", description: "Have a chat and some cappucchinos in this new Café", max_participants: "5", start_date: "14.04.2020 17:00", end_date: "14.04.2020 20:00", category: "Private", user_id: (User.all.last.id - 8))
event_5 = Event.create!(title: "Cappuchino Meet-up #2", location: "Kronenstrasse 42 8006 Zürich", description: "Have a chat and some cappucchinos in this new Café", max_participants: "1", start_date: "10.03.2020 15:00", end_date: "10.03.2020 17:00", category: "Public", user_id: (User.all.last.id - 8))
event_6 = Event.create!(title: "Cappuchino Meet-up #3", location: "Kronenstrasse 42 8006 Zürich", description: "Have a chat and some cappucchinos in this new Café", max_participants: "1", start_date: "10.03.2020 15:00", end_date: "10.03.2020 17:00", category: "Private", user_id: (User.all.last.id - 4))
event_7 = Event.create!(title: "Cappuchino Meet-up #4", location: "Kronenstrasse 42 8006 Zürich", description: "Have a chat and some cappucchinos in this new Café", max_participants: "1", start_date: "10.03.2020 15:00", end_date: "10.03.2020 17:00", category: "Public", user_id: (User.all.last.id - 3))

invitation_1 = Invitation.create!(user_id: (User.all.last.id - 9) , event_id: (Event.all.last.id - 4))
invitation_2 = Invitation.create!(user_id: (User.all.last.id - 7) , event_id: (Event.all.last.id - 3))
invitation_3 = Invitation.create!(user_id: (User.all.last.id - 6) , event_id: (Event.all.last.id - 2))
invitation_4 = Invitation.create!(user_id: (User.all.last.id - 5) , event_id: (Event.all.last.id - 1))
invitation_5 = Invitation.create!(user_id: (User.all.last.id - 8) , event_id: (Event.all.last.id))
invitation_5 = Invitation.create!(user_id: (User.all.last.id - 9) , event_id: (event_6.id))

participation_1 = Participation.create!(user_id: (User.all.last.id - 9) , event_id: (Event.all.last.id - 1))
participation_2 = Participation.create!(user_id: (User.all.last.id - 9) , event_id: (Event.all.last.id - 2))
participation_4 = Participation.create!(user_id: (User.all.last.id - 8) , event_id: (Event.all.last.id - 3))
participation_5 = Participation.create!(user_id: (User.all.last.id - 7) , event_id: (Event.all.last.id - 4))


# puts "End of seed!"
puts "End of seed!"

