class LogsController < ApplicationController
before_action :authenticate_user!
	def index

		@logs = Log.all


		render :'logs/index'
	end


	def new
		#load all items
		@item = Item.all

		#load all users
		@user = User.all
	 

		render :'logs/new'
	end

	def show
		#load all items
		@item = Item.all

		#load all users
		@user = User.all

	    #load all log
	    @log = Log.find params[:id]


	    render :'logs/show'
  	end

	def create
		 log = Log.create(log_params)

		 log.save

    	redirect_to :logs
	end

private
	def log_params
		params.require(:log).permit(:item_id, :user_id, :given_to,:date_taken, :returner_id )
	end
end



# <input type="" name="log[user_id]">
# <input type="" name="log[item_id]">
# <input type="" name="log[given_to]">

# <input type="" name="log[returner_id]">

# <input type="" name="log[date_taken]">
# <input type="" name="log[date_returned_]">



# <table class="table table-hover">
#   <tr>
#     <th>Tech User</th>
#     <th>Item</th>
#     <th>Tech Given To</th>
#     <th>Date Taken</th>
#   </tr>

#   <tr>
# 	  <th name="log[user_id]"><%= @log.user.user_name %><% %></th>
# 	   <th>
# 		   <select name="log[item_id]" class="form-control">
# 		   <% @item.each do |item| %>
# 			  <option value="1"><%= item.item_model %></option>
# 			  <%end%>
# 			</select>
# 		</th>
# 	   <th>
# 		   <select name="log[user_id]"  class="form-control">
# 		   <% @user.each do |user| %>
# 			  <option value="2"><%= user.user_name %></option>
# 			  <%end%>
# 			</select>
# 		</th>
# 	   <th>
# 	   	<input type="hidden" name="log[date_taken]" value="<%= Time.now.strftime("%Y/%m/%d") %>"><%= Time.now.strftime("%Y/%m/%d") %>
# 	   </th>

#   </tr>
# </table>


