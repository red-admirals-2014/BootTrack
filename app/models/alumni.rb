require 'json'

class Alumni
  attr_reader :name, :email, :location, :current_employer
  def initialize(args)
    @name = args[@name]
    @email = args[@email]
    @location ||= location
    @current_employer ||= args[]
  end

  def location

  end
end
