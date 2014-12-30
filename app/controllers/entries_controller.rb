class EntriesController < ApplicationController
	def sign_in
		@name = params[:visitor_name]
		@name1 = params[:visitor_name1]
		unless @name.blank?
		 @entry = Entry.create({:name => @name})
		end
		@entries = Entry.all
    end
end
