# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



################################ drop database ##############################

# rake db:drop

# ################################ 3 rake commands ##############################

# rake db:create

# rake db:migrate

# rake db:seed

# ############### rake commands that do all three above #########################

# rake db:setup

################################ basic model used ##############################

# rails g model user user_name:string user_email:string user_password:string



# rails g model user user_name:string user_email:string

# rails g model item item_model:string item_serial_number:string

# rails g model log item:references user:references given_to:integer returned_by:integer date_taken:date  date_returned:date

# rails g model log item:references user:references given_to:user returned_by:user date_taken:date  date_returned:date
  

# rails g model log item:references user:references given_to:references returned_by:references  date_taken:date date_returned:date


 # add_column :log, :given_to:references 
 # add_column :log, :returned_by:references 

  # belongs_to :given_to
  # belongs_to :returned_by


################################ insert to data  ##############################


user = User.create({user_name:'Bob', user_email:'bob@gmail.com'})
user2 = User.create({user_name:'Anna', user_email:'anna@hotmail.com'})
user3 = User.create({user_name:'Jhon', user_email:'jhon@test.com'})

item = Item.create({item_model:'Macbook 2016', item_serial_number:'MJKUY3TGVS0P'}) 
item2 = Item.create({item_model:'Macbook 2015', item_serial_number:'NGHJUY90KLYD'}) 

log = Log.create({item_id:item.id, user_id:user.id, given_to:user.id, returner_id:user2.id, date_taken:'01/03/2017', date_returned:'11/03/2017' })
log2 = Log.create({item_id:item2.id, user_id:user2.id, given_to:user.id , returner_id:user.id, date_taken:'01/03/2017', date_returned:'11/03/2017' })
log3 = Log.create({item_id:item.id, user_id:user2.id, given_to:user3.id , returner_id:user3.id, date_taken:'01/03/2017', date_returned:'11/03/2017' })






##################################### advanced model in use ########################################################


 # rails g model user user_name:string user_email:string given_to_user_id:integer

# rails g model item item_model:string item_serial_number:string

# rails g model log item:references user:references given_to:integer date_taken:date returned_by:integer date_returned:date checked:text


# rails g model log item:references user:references given_to:integer date_taken:date returned_by:integer date_returned:date checked:text



################################ rake db:seed ##############################
####### user data #####################################################
# user_name | user_email | user_given_to

# user = User.create({user_name:'Bob', user_email:'bob@gmail.com', given_to_user_id: 1})
# user2 = User.create({user_name:'Anna', user_email:'anna@hotmail.com', given_to_user_id: 2})

# # ######## item data ################################################################

# # item_model | item_serial_number 

# item = Item.create({item_model:'Macbook 2016', item_serial_number:'MJKUY3TGVS0P'}) 
# item2 = Item.create({item_model:'Macbook 2016', item_serial_number:'MJKUY3TGVS0P'}) 


# ######### log data ##################################################################
#  # user_id | date_taken | returned_by | date_returned | checked 

#   log = Log.create({item_id:item.id, user_id:user.id, date_taken:'01/03/2017', date_returned:'11/03/2017', checked:'yes'})
#   log2 = Log.create({item_id:item2.id, user_id:user2.id, date_taken:'01/03/2017', date_returned:'11/03/2017', checked:'yes'})


###########################################################################

