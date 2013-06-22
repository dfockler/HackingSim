require "software/linux_software"
#Contains properties and functions similar to a computer
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
    #basically the 'processor'
    def message(command, *args)
        if @software.include?(command)
            if args.size > 0
                self.send(command, *args)
            else
                self.send(command)
            end
        end 
    end


end