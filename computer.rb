#!/usr/bin/ruby
class Computer

  attr_reader :mac
  attr_reader :inter_ip
  attr_reader :extern_ip
  attr_reader :opsys
  def initialize(mac, inter_ip, extern_ip, opsys)
    @mac = mac
    @inter_ip = inter_ip
    @extern_ip = extern_ip
    @opsys = opsys
  end

  def getArray()
    iptables = Hash.new
    iptables[[0,0]] = 'hello'
    iptables[[0,1]] = 'world'
    puts iptables[[0,0]]
    puts iptables[[0,1]]
  end

end