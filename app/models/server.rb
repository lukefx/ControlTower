class Server < ActiveRecord::Base

  has_many :deployments
  has_many :versions, through: :deployments

  validates_presence_of :name
  validates_uniqueness_of :name

  before_save :set_ip, if: Proc.new { |server| !server.ip? }

  def status
    Net::Ping::TCP.new(self.ip || self.name, 'http').ping?
  end

  private

  def set_ip
    self.ip = Socket::getaddrinfo(self.name, 'www', nil, Socket::SOCK_STREAM)[0][3]
  end

end
