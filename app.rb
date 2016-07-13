#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:barbershop.db"


class Client < ActiveRecord::Base
	validates :name, presence: true
	validates :phone, presence: true
	validates :datestamp, presence: true
	validates :color, presence: true
end


class Barber < ActiveRecord::Base
end


before do
	@barbers = Barber.all
end

get '/' do
	erb :index
end

get '/visit' do
	erb :visit
end

post '/visit' do
	@username = params[:username]
	@phone = params[:phone]
	@datestamp = params[:datestamp]
	@barber = params[:barber]
	@color = params[:color]


	#erb "@username = #{@username}	@phone = #{@phone}	@datestamp = #{@datestamp}	@barber = #{@barber}	@color = #{@color}"	#c = Client.new
	c = Client.new
	c.name = @username
	c.phone = @phone
	c.datestamp = @datestamp
	c.barber = @barber
	c.color = @color
	c.save

	if c.valid? 
		erb "All right"
	else
		@error = c.errors.full_messages.first
		erb :visit
	end

	
end

