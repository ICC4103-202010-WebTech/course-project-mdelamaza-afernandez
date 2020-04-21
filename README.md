# README
Martín de la Maza

Alvaro Fernández


#Gitignore file sql lines are commented, you may need to use rade db:drop ( not sure ) 

Model Layer demostration:

3.1.2) 



1) Guest.where("user_id = ? AND owner = ?", 3,true)


2) Membership.select(:user_id).where(organization_id: '1')


3)Event.select(:Id).where("organization_id = ? AND private = ?", 1,false)


4)Event.select(:Id).where("organization_id = ? AND private = ?", 1,true)


5)Guest.select(:user_id).where(event_id: '1')


6)Vote.select(:user_id).where(event_id: '1')


7)Comment.where(event_id:'1')


8)Comment.where(user_id: '3')


9)Membership.select(:user_id).where(organization_id: '1')


10) User.where("Admin= ?",true)


11) In the app.


12) In the app.



13) If one event is deleted, then all votes, date options, multimedia, guests ( different from user model), reports of this event, comments of this events, notifications of this event has to be deleted to. 


If not, it would be information that could cause problems in future queries request. 



14) As well as in the previous question, if an organisation is deleted, then all the events - and all the information that goes with it, detailed in point 13 - should be errased to.



15) We have two possible outcomes from this situation, A) If the user is the only owner of an organization and/or and event, both will be delated with all information that goes with it. In the other hand, if B) The user is a co-owner of an event and/or an organization, they wont be delated.
Allthough, users comments and multimedia will be errased in both scenarios.



This README would normally document whatever steps are necessary to get the
application up and runnin


Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
