require "./hardware/computer"

users = Hash.new
users["Andy"] = "pizzaparty"
users["Dan"] = "jungle"
users["Carl"] = "carl"
comp = Computer.new("BC-AE-C5-38-F3-CA","192.168.1.100","68.193.56.2","linux", users, "IT-FD", ['packets', 'help', 'ifconfig', 'login', 'calc', 'lots', 'ping'])
comp.message("login", "Welcome to the NSA Classified Database Server\n")
# comp2 = Computer.new("BC-AE-C5-38-F3-CA","192.168.1.101","68.193.56.2","linux", users, "IT-FD", ['packets', 'help', 'ifconfig', 'login', 'calc', 'lots'])