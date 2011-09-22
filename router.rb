class Router < Computer
  
  attr_reader :ports
  
  def initialize(mac, inter_ip, extern_ip, opsys, ports)
    super(mac, inter_ip, extern_ip, opsys)
    @ports = ports
  end
end