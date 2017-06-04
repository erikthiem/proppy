class CreatorNotifierMailer < ApplicationMailer
	default :from => 'noreply@prop-e.herokuapp.com'


	def game_created(creator, game)
		@creator = creator
		@game = game
		mail( :to => @creator.email,
		:subject => 'Congrats, your game was created!' )
	end


end
