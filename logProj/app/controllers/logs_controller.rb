class LogsController < ApplicationController

	def index

		@logs = Log.all

		render :'logs/index'
	end


	def new
	end



	def show
	    #load all log

	    @log = Log.find params[:id]


	    render :'logs/show'
  	end

	def create
	end


end


# <p><%= log.user_id %></p>
#    <p><%= log.given_to %></p>
#    <p><%= log.date_taken %></p>
#    <p><%= log.returned_by %></p>
#    <p><%= log.date_returned %></p>
#    <p><%= log.checked %></p>

