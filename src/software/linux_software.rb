require 'optparse'

module LinuxSoftware

	def help(message1, message2)
		puts "Cats " + message1 + " " + message2
	end
	
	def ifconfig()
		print_ip()
	end

	def print_ip()
		puts "Internal IP: %s" % @inter_ip
		puts "External IP: %s" % @extern_ip
		puts "MAC: %s" % @mac
	end

	def ping(*args)

		options = {}
		options[:count] = 5

		opt_parser = OptionParser.new do |opts|
			opts.banner = "Usage: blah blah"
			opts.separator(" ")

			opts.on("-c", "--optional [INTEGER]", Integer, "Limit ping count") do |count| 
				options[:count] = count
			end

			opts.on("-i", "--ip" "--required [STRING]", String, "Enter the IP Address of the object") do |ip|
				options[:ip] = ip
			end
		end

		opt_parser.parse!(args)
		
	end

	def calc(args)
		puts eval(args)
	end

	def lots(*args)
		
	end

	#checks login passwords/usernames
    def login(message)
        linux = ["login:", "Password: "]
        windows = ["USERNAME:", "PASSWORD:"]
        macintosh = ["user:", "password:"]
        username = ""

        print message


        if @opsys == "linux"
            print linux[0]
            username = gets.chomp 
            if @users.has_key?(username)
                print linux[1]
                password = gets.chomp
                if @users[username] == password
                    user_loop(username)
                end
            end
        end 
    end #end method

	def user_loop(username)
		while true
			print "%s@%s:~# " % [username, @name]
			input = gets.chomp
			input = input.split(' ', 2)
			command = input[0]
			args = input[1]

	        if !input[1].nil?
	            args = input[1].split(' ')
	            if args.size == 1
	                args = args[0]
	            end
	        end

	        if @software.include?(command)
	            if !args.nil? 
	                self.send(command, *args)
	            else
	                self.send(command)
	            end
			elsif command == "exit"
				print("Shutting down...\n")
				sleep 3
				print "Goodbye..."
				break
			else
				puts("Command: %s not found" % command)
			end
		end
	end
	
end