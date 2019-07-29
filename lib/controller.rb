require 'gossip'

class ApplicationController < Sinatra::Base
 	get '/' do
  		erb :index, locals: {gossips: Gossip.all}
  	end

  	get '/gossips/new/' do
  		erb :new_gossip
 	end

	post '/gossips/new/' do
 		Gossip.new(params["gossip_author"], params["gossip_content"]).save
 		redirect '/'
	end

	get '/gossips/:id' do
     	erb :show, locals: {gossip: Gossip.find(params[:id])}
	end

	get '/gossips/edit/:id' do
		erb :edit_gossip
	end

	post '/gossips/edit/:id' do
		Gossip.edit(params[:id],params['gossip_content'],params['gossip_author'])
		redirect '/gossips/:id'
	end
end


