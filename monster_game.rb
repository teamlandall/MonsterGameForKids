class Monster
	attr_reader :name, :actions

	#initialize the variables
	def initialize
		@name = name
		@actions = {
			screams: 0,
			scares: 0,
			chases: 0,
			hides: 0
		}
	end

	#introduction and request a name for the monster
	def say(&block)
		print "What do you want to call your monster? "
		@name = gets.chomp
		print "#{name} says... "
		yield
	end

	#asks the user what they want the monster to do. Uses case statement to call appropriate method.
	def scary_stuff
		print "#{@name} can do some scary stuff! What do you want #{@name} to do? \n (Scream, scare you, chase you or hide from you?): "
		answer = gets.chomp.downcase

		case answer
		when "scream"
			scream
		when "scare" 
			scare
		when "chase"
			chase
		when "hide"
			hide
		else
			puts "\n Ok, maybe you'll want to play with #{name} a little later."
		end
		repeat
	end

	#after the initially selected method runs, this is called which allows the game to keep going.
	def repeat
		print "\n Do you want to keep playing with #{@name}? (y/n): "
		answer = gets.chomp.downcase
		if answer == "y"
			scary_stuff
		else
			print "\n Here's a recap of your monster adventure: "
			print_scoreboard
		end
	end

	#Scoreboard for each action that gets updated each time the option is selected.
	def print_scoreboard
		puts "\n"
		puts "-" * 50
		puts "#{@name}'s Scary Action Scoreboard"
		puts "-" * 50
		puts "- Screams: #{actions[:screams]}"
		puts "- Scares: #{actions[:scares]}"
		puts "- Chases: #{actions[:chases]}"
		puts "- Hides: #{actions[:hides]}"
		puts "-" * 50 
	end

	#asks the user how many times they'd like the monster to scream. 
	def scream(&block)
		print "Good choice. How many times should #{@name} scream? "
		number = gets.chomp.to_i
		number.times { print "\n AAAGGGHHHHHH!! \n\n" }
		puts "Wow! That's some scary screaming #{@name}!"
		actions[:screams] += 1
	end

	#Uses random numbers between 3 and 10 to start a slow countdown, ending with a "Boo!"
	def scare(&block)
		print "#{@name} is a great scarer. But you never know when it is coming...\n"
		i = rand(10)
		j = rand(3)
			for i in (i).downto(j)
				puts "\n #{i} \n" 
				sleep(2.0)
			end
		puts "\n BOOOOOO! \n"
		print "\n #{@name} scared you! \n"
		actions[:scares] += 1
	end

	#Chase option. Sort of boring.
	def chase(&block)
		print "#{@name} is super fast. Up on your feet and start running! \n"
		print "Uh oh. Here comes #{@name}! Run faster! \n"
		puts "\n Go! \n Go! \n Go! \n Go! \n Go! \n"
		print "\n Boy are you fast! #{@name} couldn't catch you!"
		actions[:chases] += 1
	end

	#hide option. Not much exciting here either. 
	def hide(&block)
		print "\n #{@name} loves to play hide and seek. He's a good hider."
		print "\n Close your eyes, count to 10 and then go find him."
		for i in 1..10 do
			puts "\n #{i} \n"
			i += 1
		end
		print "\n Ok, Go find #{@name}!"
		actions[:hides] += 1
	end
end 

monster = Monster.new
monster.say { puts "Oh man I am a scary monster!"}
monster.scary_stuff


