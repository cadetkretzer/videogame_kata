counter = 100
while counter > 1
	if counter % 3 == 0
		puts "video"

	elsif 
		counter % 5 == 0
		puts "game"
	elsif 
		counter % 5 & 3 == 0
		puts "video game"
		
	else
		puts counter
	end
	counter-=1
end
			