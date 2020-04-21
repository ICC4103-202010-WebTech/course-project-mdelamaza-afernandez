###user
user1 = User.create(email: "cavd@miuandes.cl", user_name:"cavd", password:"123",location:"casa 1",description:"solo hablo español")
user2 = User.create(email: "aff@miuandes.cl", user_name:"aff", password:"123",location:"casa 2",description:"hello")
user3 = User.create(email: "medlm@miuandes.cl", user_name:"mdlm", password:"123",location:"casa 3",description:"hi")
user4 = User.create(email: "gira@miuandes.cl", user_name:"gira", password:"123",location:"casa 4",description:"F")
user1.save!
user2.save!
user3.save!
user4.save!
###organization
organization1= Organization.create(name:"Friends", description:"just a group of friends",creation_date:'2013-02-02 01:00:00' )
organization2= Organization.create(name:"college", description:"college group",creation_date:'2013-02-02 01:00:00' )
organization1.save!
organization2.save!
###event
event1= Event.create(name:"Alvaro Birthday",location:"casa 3",description:"alvaro secret birthday",private:true)
event2= Event.create(name:"study night",location:"casa 1",description:"noche de estudio donde cami",private:false )
event1.organization_id = organization1.id
event2.organization_id = organization2.id
event1.save!
event2.save!
#guest
guest1 = Guest.create(owner:true)
guest2 = Guest.create(owner:false )
guest3 = Guest.create(owner:false )
guest4 = Guest.create(owner:true)
guest5 = Guest.create(owner:false )
guest6 = Guest.create(owner:false )
guest1.event_id = event1.id
guest2.event_id = event1.id
guest3.event_id = event1.id
guest4.event_id = event2.id
guest5.event_id  =event2.id
guest6.event_id = event2.id
guest1.user_id = user3.id
guest2.user_id = user1.id
guest3.user_id = user4.id
guest4.user_id = user1.id
guest5.user_id = user2.id
guest6.user_id = user3.id
guest1.save!
guest2.save!
guest3.save!
guest4.save!
guest5.save!
guest6.save!


#membership
membership1 = Membership.create(owner: true , date:'2013-02-02 01:00:00' )
membership2 = Membership.create(owner: false , date:'2014-02-02 01:00:00' )
membership3 = Membership.create(owner: false , date:'2014-02-02 01:00:00')
membership4 = Membership.create(owner: false , date:'2014-02-02 01:00:00' )
membership5 = Membership.create(owner: true , date:'2013-02-02 01:00:00' )
membership6 = Membership.create(owner: false , date:'2014-02-02 01:00:00' )
membership7 = Membership.create(owner: false , date:'2014-02-02 01:00:00')
membership1.organization_id = organization1.id
membership2.organization_id = organization1.id
membership3.organization_id = organization1.id
membership4.organization_id = organization1.id
membership5.organization_id = organization2.id
membership6.organization_id = organization2.id
membership7.organization_id = organization2.id
membership1.user_id = user3.id
membership2.user_id = user1.id
membership3.user_id = user2.id
membership4.user_id = user4.id
membership5.user_id = user3.id
membership6.user_id = user1.id
membership7.user_id = user2.id
membership1.save!
membership2.save!
membership3.save!
membership4.save!
membership5.save!
membership6.save!
membership7.save!
#comment
comment1 = Comment.create(msg:"msg 1")
comment2 = Comment.create(msg:"msg 2")
comment3 = Comment.create(msg:"msg 3")
comment1.event_id = event1.id
comment2.event_id = event1.id
comment3.event_id= event2.id
comment1.user_id=user2.id
comment2.user_id=user3.id
comment3.user_id=user2.id



