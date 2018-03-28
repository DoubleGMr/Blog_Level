# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create!(name:  "Example User",
             email: "example@example.com",
             password:              "example",
             password_confirmation: "example",
             admin: true,
             activated: true,
             activated_at: Time.now.to_s(:db))

20.times do |n|
	name = Faker::Name.name
	email = "example-#{n+1}@railstutorial.org"
	password = "password"
	users = User.create!(name: name,
                 email: email,
                 password:              password,
                 password_confirmation: password,
                 activated: true,
                 activated_at: Time.now.to_s(:db))

tag = user.tags.create(
            name: Faker::Lorem.sentence(2),
            introduce: Faker::Lorem.paragraph,
            user: user
        )

post = user.posts.create(
    title: Faker::Lorem.word,
    content: Faker::Lorem.paragraph,
    publish: true,
    user: user,
    tag: tag
    )

comment = users.comments.create(
        content: Faker::Lorem.paragraph,
        user: users,
        post: post
    )

end

