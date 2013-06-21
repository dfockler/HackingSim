module LinuxSoftware

	def help(message)
		puts "Cats " + message
	end
	
	def ifconfig()
		print_ip()
	end

	def print_ip()
		puts "Internal IP: %s" % @inter_ip
		puts("External IP: %s" % @extern_ip)
		puts("MAC: %s" % @mac)
	end

	def calc(args)
		puts eval(args)
	end

	#checks login passwords/usernames
    def login(message)
        linux = ["login:", "Password: "]
        windows = ["USERNAME:", "PASSWORD:"]
        macintosh = ["user:", "password:"]
        username = ""

        print message


        if(@opsys == "linux")
            print linux[0]
            username = gets.chomp 
            if (users.has_key?(username))
                print linux[1]
                password = gets.chomp
                if(@users.key(password) == username) 
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
	                self.send(command, args)
	            else
	                self.send(command)
	            end
			elsif(command == "exit")
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