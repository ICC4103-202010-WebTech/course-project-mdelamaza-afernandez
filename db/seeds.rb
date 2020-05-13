###user
user1 = User.create(email: "cavd@miuandes.cl", user_name:"cavd", password:"123",location:"casa 1",description:"solo hablo español",Admin: false)
user2 = User.create(email: "aff@miuandes.cl", user_name:"aff", password:"123",location:"casa 2",description:"hello",Admin: false)
user3 = User.create(email: "medlm@miuandes.cl", user_name:"mdlm", password:"123",location:"casa 3",description:"hi",Admin: true)
user4 = User.create(email: "gira@miuandes.cl", user_name:"gira", password:"123",location:"casa 4",description:"F",Admin: false)
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
comment1.save!
comment2.save!
comment3.save!
#date option
# 1
date1 = DateOption.create(date:'2019-05-02 01:00:00')
date2 = DateOption.create(date:'2019-05-03 01:00:00')
date1.event_id = event1.id
date2.event_id = event1.id
date1.save!
date2.save!
#2
date3 = DateOption.create(date:'2019-05-04 01:00:00')
date4 = DateOption.create(date:'2019-05-05 01:00:00')
date3.event_id = event1.id
date4.event_id = event1.id
date3.save!
date4.save!
#3
date5 = DateOption.create(date:'2019-05-10 01:00:00')
date6 = DateOption.create(date:'2019-05-11 01:00:00')
date5.event_id = event2.id
date6.event_id = event2.id
date5.save!
date6.save!
#4
date7 = DateOption.create(date:'2019-05-12 01:00:00')
date8 = DateOption.create(date:'2019-05-13 01:00:00')
date7.event_id = event2.id
date8.event_id = event2.id
date7.save!
date8.save!
#notification
# uno
notification1=Notification.create(msg:"notificacion 1")
notification2=Notification.create(msg:"notificacion 2")
notification3=Notification.create(msg:"notificacion 3")
notification1.user_id=user1.id
notification2.user_id=user1.id
notification3.user_id=user4.id
notification1.event_id=event1.id
notification2.event_id=event2.id
notification3.event_id=event2.id
notification1.save!
notification2.save!
notification3.save!
# dos
notification4=Notification.create(msg:"notificacion 4")
notification5=Notification.create(msg:"notificacion 5")
notification6=Notification.create(msg:"notificacion 6")
notification4.user_id=user3.id
notification5.user_id=user4.id
notification6.user_id=user2.id
notification4.event_id=event1.id
notification5.event_id=event1.id
notification6.event_id=event2.id
notification4.save!
notification5.save!
notification6.save!
#votes
# 1
vote1 = Vote.create()
vote2 = Vote.create()
vote1.date_option_id = date1.id
vote2.date_option_id = date2.id
vote1.user_id = user1.id
vote2.user_id = user3.id
vote1.save!
vote2.save!
#2
vote3 = Vote.create()
vote4 = Vote.create()
vote3.date_option_id = date4.id
vote4.date_option_id = date8.id
vote3.user_id = user4.id
vote4.user_id = user1.id
vote3.save!
vote4.save!
#3
vote5 = Vote.create()
vote6 = Vote.create()
vote5.date_option_id = date7.id
vote6.date_option_id = date6.id
vote5.user_id = user2.id
vote6.user_id = user3.id
vote5.save!
vote6.save!
#mail box
# 1
mail_box1 = MailBox.create(inbox: "msg 1")
mail_box2 = MailBox.create(inbox: "msg 2")
mail_box1.user_id=user1.id
mail_box2.user_id=user2.id
mail_box1.save!
mail_box2.save!
#2
mail_box3 = MailBox.create(inbox: "msg 3")
mail_box4 = MailBox.create(inbox: "msg 4")
mail_box3.user_id=user3.id
mail_box4.user_id=user4.id
mail_box3.save!
mail_box4.save!
#Reports
report1 = Report.create(description: "Evento publico, Alvaro se entero")
report1.event_id=event1.id
report1.comment_id= comment1.id
report1.organization_id=organization1.id
report1.user_id=user3.id
report1.save!
report2 = Report.create(description: "Camila se quedo dormida y no abrio la puerta")
report2.event_id=event2.id
report2.comment_id= comment1.id
report2.organization_id=organization2.id
report2.user_id=user2.id
report2.save!

