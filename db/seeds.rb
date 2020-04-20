# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#user
user1 = User.create(email: "cavd@miuandes.cl", user_name:"cavd", password:"123",location:"casa 1",description:"solo hablo español")
user2 = User.create(email: "aff@miuandes.cl", user_name:"aff", password:"123",location:"casa 2",description:"hello")
user3 = User.create(email: "medlm@miuandes.cl", user_name:"mdlm", password:"123",location:"casa 3",description:"hi")
user4 = User.create(email: "gira@miuandes.cl", user_name:"gira", password:"123",location:"casa 4",description:"F")
#event
event1= Event.create(name:"Alvaro Birthday",location:"casa 3",description:"alvaro secret birthday",private:true)
event2= Event.create(name:"study night",location:"casa 1",description:"noche de estudio donde cami",private:false )
#organization
organization1= Organization.create(name:"Friends", description:"just a group of friends",creation_date:'2013-02-02 01:00:00' )
organization2= Organization.create(name:"college", description:"college group",creation_date:'2013-02-02 01:00:00' )
#guest
#event 1
guest1 = Guest.create(owner:true)
guest2 = Guest.create(owner:false )
guest3 = Guest.create(owner:false )
#event 2
guest4 = Guest.create(owner:true)
guest5 = Guest.create(owner:false )
guest6 = Guest.create(owner:false )

#membership

#O1
membership1 = Membership.create(owner: true , date:'2013-02-02 01:00:00' )
membership2 = Membership.create(owner: false , date:'2014-02-02 01:00:00' )
membership3 = Membership.create(owner: false , date:'2014-02-02 01:00:00')
membership4 = Membership.create(owner: false , date:'2014-02-02 01:00:00' )
#O2
membership5 = Membership.create(owner: true , date:'2013-02-02 01:00:00' )
membership6 = Membership.create(owner: false , date:'2014-02-02 01:00:00' )
membership7 = Membership.create(owner: false , date:'2014-02-02 01:00:00')

#votes
# e1
vote1 = Vote.create()
vote2 = Vote.create()
vote3 = Vote.create()
#e2
vote4 = Vote.create()
vote5 = Vote.create()
vote6 = Vote.create()

#date option
# e1
date1 = DateOption.create(date:'2019-05-02 01:00:00')
date2 = DateOption.create(date:'2019-05-03 01:00:00')
date3 = DateOption.create(date:'2019-05-04 01:00:00')
date4 = DateOption.create(date:'2019-05-05 01:00:00')
#e2
date5 = DateOption.create(date:'2019-05-10 01:00:00')
date6 = DateOption.create(date:'2019-05-11 01:00:00')
date7 = DateOption.create(date:'2019-05-12 01:00:00')
date8 = DateOption.create(date:'2019-05-13 01:00:00')

#dependence
# User
#events
event1.organization_id<<organization1
event2.organization_id<<organization2
#organizations
#Guest
guest1.event_id<<event1
guest2.event_id<<event1
guest3.event_id<<event1
guest4.event_id<<event2
guest5.event_id<<event2
guest6.event_id<<event2
guest1.user_id<<user3
guest2.user_id<<user1
guest3.user_id<<user4
guest4.user_id<<user1
guest5.user_id<<user2
guest6.user_id<<user3
#membership
membership1.organization_id<<organization1
membership2.organization_id<<organization1
membership3.organization_id<<organization1
membership4.organization_id<<organization1
membership5.organization_id<<organization2
membership6.organization_id<<organization2
membership7.organization_id<<organization2
membership1.user_id<<user3
membership2.user_id<<user1
membership3.user_id<<user2
membership4.user_id<<user4
membership5.user_id<<user3
membership6.user_id<<user1
membership7.user_id<<user2
#votes
vote1.date_option_id<<date1
vote2.date_option_id<<date2
vote3.date_option_id<<date4
vote4.date_option_id<<date8
vote5.date_option_id<<date7
vote6.date_option_id<<date6
vote1.user_id<<user1
vote2.user_id<<user3
vote3.user_id<<user4
vote4.user_id<<user1
vote5.user_id<<user2
vote6.user_id<<user3
#DO
date1.event_id<<event1
date2.event_id<<event1
date3.event_id<<event1
date4.event_id<<event1
date5.event_id<<event2
date6.event_id<<event2
date7.event_id<<event2
date8.event_id<<event2

#save
user1.save!
user2.save!
user3.save!
user4.save!
event1.save!
event2.save!
organization1.save!
organization2.save!