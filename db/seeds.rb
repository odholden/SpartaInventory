# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Rails.application.routes.draw do


#   devise_for :users
#   get 'users/index'

#   get 'welcome/index'


#    # get '/logs/:id', to: 'logs#show'
#   resources :logs do
#   	  resources :logs, only: [:create]
#   end


#   root 'welcome#index'
#   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# end



#   enable_extension "plpgsql"

#   create_table "items", force: :cascade do |t|
#     t.string   "item_model"
#     t.string   "item_serial_number"
#     t.datetime "created_at",         null: false
#     t.datetime "updated_at",         null: false
#   end

#   create_table "logs", force: :cascade do |t|
#     t.integer  "item_id"
#     t.integer  "user_id"
#     t.integer  "given_to"
#     t.integer  "returner_id"
#     t.date     "date_taken"
#     t.date     "date_returned"
#     t.datetime "created_at",    null: false
#     t.datetime "updated_at",    null: false
#     t.index ["item_id"], name: "index_logs_on_item_id", using: :btree
#     t.index ["user_id"], name: "index_logs_on_user_id", using: :btree
#   end

#   create_table "users", force: :cascade do |t|
#     t.string   "user_name"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#   end

#   add_foreign_key "logs", "items"
#   add_foreign_key "logs", "users"
# end







# class User < ApplicationRecord

# 	belongs_to :returner, :class_name => 'User'

#  end


# class Log < ApplicationRecord
#   belongs_to :item
#   belongs_to :user
#   belongs_to :returner, :class_name => 'User', :required => false

# end



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

# rails g model item item_model:string item_serial_number:string loan:boolean
# rails generate migration add_loan_to_items loan:boolean

# rails g model log item:references user:references given_to:text returner_id:integer  date_taken:date date_returned:date notes:text


 # add_column :log, :given_to:references 
 # add_column :log, :returned_by:references 

  # belongs_to :given_to
  # belongs_to :returned_by


################################ insert to data  ##############################


# user = User.create({user_name:'Bob'})
# user2 = User.create({user_name:'Anna'})
# user3 = User.create({user_name:'Jhon'})

 item = Item.create({item_model:'Macbook 2010', item_serial_number:'DFRUY3TGV333'}) 
 item1 = Item.create({item_model:'Macbook 2011', item_serial_number:'LOPUY3TG111'}) 
 item2 = Item.create({item_model:'Macbook 2012', item_serial_number:'GHTJUY90K000'}) 
 item3 = Item.create({item_model:'Macbook 2013', item_serial_number:'ASDJUY90K777'}) 

# log = Log.create({item_id:item.id, user_id:user.id, given_to:user.id, returner_id:user2.id, date_taken:'01/03/2017', date_returned:'11/03/2017' })
# log2 = Log.create({item_id:item2.id, user_id:user2.id, given_to:user.id , returner_id:user.id, date_taken:'01/03/2017', date_returned:'11/03/2017' })
# log3 = Log.create({item_id:item.id, user_id:user2.id, given_to:user3.id , returner_id:user3.id, date_taken:'01/03/2017', date_returned:'11/03/2017' })






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

