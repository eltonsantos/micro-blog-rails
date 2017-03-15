10.times do
  u = User.create(username: Faker::Internet.user_name, email: Faker::Internet.email, password: 123456)
  15.times do
    Post.create(message: Faker::Lorem.paragraph, user_id: u.id)
  end
end

User.create(username: 'eltin182', email: 'elton@elton.com', password: 123456)
Post.create(message: 'Um simples texto de boas vindas criadas', user_id: 11)
