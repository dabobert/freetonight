class Availability < ActiveRecord::Base
  # attr_accessible :title, :body
  #Thing.find(:all, :condition => ["created_at > ?", Time.now - 1.day])

  #Time is stored internally as the number of seconds with fraction since the Epoch, January 1, 1970 00:00 UTC.
  #Just format it like this: t = Time.now.strftime("at %I:%M%p")


=begin
Andrew: i'd store daily, weekly, monthly and yearly repeats separately
  
then to query the rule, you just normalize out the day, week, month and year
  
then query by if time > start and time < start + duration
2:33 PM 
so if this is a daily rule, then make todays date = jan 1, 1970
  
if it's a weekly rule, only keep the day of the week
  
if it's monthly, only keep the day of the month
2:34 PM 
me: so query each repeated rule table (daily, monthly, etc)
  
sure
  
but do i then union them
2:35 PM 
or is there no need for that
  
oh
  
translate the date
  
into the appropriate test
 
Andrew: right
 
me: per table
 
Andrew: much simpler
2:36 PM 
whether you store in one or 4 tables is up to you, but you would have an appropriate mapper for each rule/repeat type
 
me: true, but gonna try a proof of concept in rails
  
and multuple tables for 1 model
  
may be a pain
 
Andrew: it's whether you have a flag for rule type or not
 
me: true
 
Andrew: it can be one model
  
you'd just do
 
me: yeah
 
Andrew: if Type = 'daily' --
  
or have a different model for each rule type
  
it doesn't really matter which way you go
2:37 PM 
but a different model might be easier
  
more OOP
 
me: never thought about only grabbing relevant datetime portion
2:38 PM 
based on period type
=end  

end