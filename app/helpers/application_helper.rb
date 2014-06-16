# CR Move this to it's own class in lib and call from a cron or background job to get around rate limits.
# Use .yml or .env files for keys!!!
module ApplicationHelper

  def get_linked_in(grad)
    client = LinkedIn::Client.new('752jy5l9lpe28m', 'GcvQ6BiPEAST2Q1k')
    client.authorize_from_access("bf114d38-e842-48e2-b3c1-5213a67a5bfb", "1c24a8d4-2d13-49e0-bccd-fde2784e40ce")
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

end
