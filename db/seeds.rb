2.times do
    user = User.create(name: Faker::FunnyName.name, email: Faker::Internet.email)
    2.times do
        user.posts.create(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph)
    end
end