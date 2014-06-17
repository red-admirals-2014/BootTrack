module ApplicationHelper

  def get_linked_in(grad)
    client = LinkedIn::Client.new(ENV["KEY"], ENV["SECRETKEY"] )
    client.authorize_from_access(ENV["USER_TOKEN"], ENV["USER_SECRET"])
    begin
      new_info = client.profile(:url => grad.linked_in , :fields => ['headline', 'location:(name)'])
      grad.update_attributes(employer: new_info.headline, location: new_info.location.name)
      p '==========='
      p '=  Succes ='
      p '==========='
    rescue StandardError => e
      p "Error: #{e}"
      grad.update_attributes(employer: nil, location: nil)
    end
  end

  def update_all_linked_in
    Graduate.all.each do |grad|
      unless grad.linked_in == nil
        ApplicationHelper.get_linked_in(grad)
        sleep 2
      end
    end
  end

  def test
    puts "test"
    return "test"
  end

end
