# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

Category.destroy_all
User.destroy_all
Post.destroy_all

puts "Creating two users"

camilo = User.create!(email: "camilogzlez@gmail.com", password: "camilogzlez")
camilo.save!

marcela = User.create!(email: "grimaldosmariamarcela@gmail.com", password: "grimaldosmariamarcela")
marcela.save!

puts "Creating three categories"

technology = Category.create!(title: "Technology")
technology.save!

opinion = Category.create!(title: "Opinion")
opinion.save!

trends = Category.create!(title: "Trends")
trends.save!

puts "Creating three posts"

post1 = Post.create!(user: camilo, title: "Artificial Intelligence (AI) and Machine Learning" , content: "Artificial Intelligence, or AI, has already received a lot of buzz in the past decade, but it continues to be one of the new technology trends because its notable effects on how we live, work and play are only in the early stages. AI is already known for its superiority in image and speech recognition, navigation apps, smartphone personal assistants, ride-sharing apps and so much more.", image: "https://images.unsplash.com/photo-1534723328310-e82dad3ee43f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1952&q=80", creation_date: Date.new(2021, 07, 1), category: technology)
post1.save!

post2 = Post.create!(user: marcela, title: "Blockchain is good?" , content: "Although most people think of blockchain technology in relation to cryptocurrencies such as Bitcoin, blockchain offers security that is useful in many other ways. In the simplest of terms, blockchain can be described as data you can only add to, not take away from or change. Hence the term “chain” because you’re making a chain of data. Not being able to change the previous blocks is what makes it so secure. In addition, blockchains are consensus-driven, so no one entity can take control of the data. With blockchain, you don’t need a trusted third-party to oversee or validate transactions.", image: "https://images.unsplash.com/photo-1487058792275-0ad4aaf24ca7?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGJsb2NrY2hhaW58ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60", creation_date: Date.new(2021, 07, 10), category: opinion)
post2.save!

post3 = Post.create!(user: camilo, title: "5G" , content: "The next technology trend that follows the IoT is 5G. Where 3G and 4G technologies have enabled us to browse the internet, use data driven services, increased bandwidths for streaming on Spotify or YouTube and so much more, 5G services are expected to revolutionize our lives. by enabling services that rely on advanced technologies like AR and VR, alongside cloud based gaming services like Google Stadia, NVidia GeForce Now and much more. It is expected to be used in factories, HD cameras that help improve safety and traffic management, smart grid control and smart retail too.", image: "https://images.unsplash.com/photo-1607301695170-1c8c738cc6df?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8NWd8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60", creation_date: Date.new(2021, 07, 8), category: trends)
post3.save!

puts "Seeds created"