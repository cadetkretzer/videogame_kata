require 'sinatra'
require_relative "hangman.rb"
enable :sessions
get '/' do 
	erb :index
end

post '/player_names' do
	player1 = params[:player1]
	player2 = params[:player2]
	"Player 1 is #{player1} and Player 2 is #{player2}!"

	redirect '/password?player1=' + player1 + '&player2=' + player2 
end

get '/password' do 
	player1 = params[:player1]
	player2 = params[:player2]
	erb :password, locals:{p1_name: player1, p2_name: player2}
end

post '/secretpassword' do
	password = params[:word]
	session[:game]=Hangman.new(password)
	player1 = params[:player1]
	player2 = params[:player2]
	"Player 1 is #{player1} and Player 2 is #{player2} and the secret word is #{password}"
	redirect '/guessing?player1=' + player1 +'&player2=' + player2
	"hello world"
end
get '/guessing' do 

	player1 = params[:player1]
	player2 = params[:player2]
	erb :guessing,locals:(p1_name: player1, p2_name: player2, array: session[:game].guessed,blank: session[:game],correct_blank)
end
post '/guess' do
	player1 = params[:player1]
	player2 = params[:player2]
	choice = params[:letter].upcase
	session[:game].correct_index(choice)
	session[:game].update_guessed(choice)
	redirect '/guessing?player1=' + player1 +'&player2=' + player2
end