# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

adam = Person.create(name: "Adam Scott", email: "ascott@parks.com", password: "password", password_confirmation: "password")
amy = Person.create(name: "Amy Poehler", email: "apoehler@rec.com", password: "password", password_confirmation: "password")

ChallengeRequest.create(person: adam, assignee: amy, text: "Write an awesome book", complete: true)
ChallengeRequest.create(person: amy, assignee: adam, text: "Write your own awesome book", complete: false)
