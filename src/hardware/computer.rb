#!/usr/bin/ruby
require_relative 'linux_sys'
require_relative 'win_sys'
require_relative '../software/linux_software'
class Computer
    include LinuxSoftware

    attr_accessor :mac
    attr_accessor :inter_ip
    attr_accessor :extern_ip
    attr_accessor :opsys
    attr_accessor :users
    attr_accessor :name

    def initialize(mac, inter_ip, extern_ip, opsys, users, name, software)
        @mac = mac
        @inter_ip = inter_ip
        @extern_ip = extern_ip
        @opsys = opsys
        @users = users
        @name = name
        @software = software
    end

    #reads a message from a computer or person
    #example: man, example: ssh connect
    def message(input)
        input = input.split(' ', 2)
        command = input[0]

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
        end 
    end

    # #checks login passwords/usernames
    # def login(message)
    #     linux = ["login:", "Password: "]
    #     windows = ["USERNAME:", "PASSWORD:"]
    #     macintosh = ["user:", "password:"]
    #     username = ""

    #     login_message(message)

    #     if(opsys == "linux")
    #         print linux[0]
    #         username = gets.chomp 
    #         if (users.has_key?(username))
    #             print linux[1]
    #             password = gets.chomp
    #             if(users.key(password) == username) 
    #                 operator = LinuxSys.new(@mac, @inter_ip, @extern_ip, @opsys, @users, @name)
    #                 operator.user_loop(username, @name, @inter_ip, @extern_ip, @mac)
    #             end
    #         end
    #     end 
    # end #end method

end