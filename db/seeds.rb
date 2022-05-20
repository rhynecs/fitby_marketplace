# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


user = User.create!(id: 100, email: "admin@admin.com", password: "admin123", created_at: "2022-05-20 10:35:20.166877000 +0000", updated_at: 
    "2022-05-20 10:35:20.166877000 +0000", first_name: "rodger", last_name: "federer", birth_date: "1981-08-08", 
    phone_number: "123456789", bio: "Hi, I teach group tennis lessons! ")
user.add_role :admin

Listing.create!(id: 100,                                                            
 title: "Beginner Tennis Lessons",                                 
 body: "Hi, I offer individual or group tennis lessons",           
 address_line_1: "Rod Laver Arena",                                
 address_line_2: "Olympic Blvd",                                   
 city: "Melborune",                                                
 postcode: "3001",                                                 
 price: 0.19999e3,                                                 
 user_id: 1,                                                       
 created_at: 'Fri, 20 May 2022 10:56:01.745982000 UTC +00:00',       
 updated_at: 'Fri, 20 May 2022 10:56:02.310275000 UTC +00:00')

user = User.create!(id: 101, email: "user@user.com", password: "user123", created_at: "2022-05-20 10:35:20.166877000 +0000", updated_at: 
    "2022-05-20 10:35:20.166877000 +0000", first_name: "mike", last_name: "tyson", birth_date: "1966-06-30", 
    phone_number: "123456789", bio: "Hi, I teach group boxing lessons! ")
user.add_role :user

Listing.create!(id: 101,                                                            
 title: "Outdoor Group Boxing Lessons",                                 
 body: "Ever want to learn how to box?",           
 address_line_1: "Royal Botanic Gardens",                                
 address_line_2: "Alexandra Ave",                                   
 city: "Melborune",                                                
 postcode: "3004",                                                 
 price: 0.5e3,                                                 
 user_id: 2,                                                       
 created_at: 'Fri, 20 May 2022 10:56:01.745982000 UTC +00:00',       
 updated_at: 'Fri, 20 May 2022 10:56:02.310275000 UTC +00:00')