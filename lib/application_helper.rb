module ApplicationHelper

  def get_linked_in(grad)
    client = LinkedIn::Client.new(ENV["KEY"], ENV["SECRETKEY"] )
    client.authorize_from_access(ENV["USER_TOKEN"], ENV["USER_SECRET"])
    begin
      new_info = client.profile(:url => grad.linked_in , :fields => ['location:(name)', 'positions'])
      location = clean_location(new_info.location.name)
      grad.update_attributes(employer: new_info.positions.all[0].company.name, title: new_info.positions.all[0].title, location: location)
      p '<<<<<<<<<<- Success ->>>>>>>>>>'
    rescue StandardError => e
      p "Error: #{e}"
      grad.update_attributes(employer: nil, location: nil)
    end
  end

  def update_all_linked_in
    i=1
    Graduate.find_each do |graduate|
      unless graduate.linked_in == nil
        ApplicationHelper.get_linked_in(graduate)
        i+=1
      end
      time= Random.rand(300..1800) if i%100==0
      p "sleeping #{time/60} minutes"
      sleep time
    end
  end

  def clean_location(location)
      location.gsub!(/(G|g)reater /,'')
      location.gsub!(/ (A|a)rea/,'')
      location.gsub!(/San Francisco Bay/,'San Francisco')
      location.gsub!(/(G|o)ther/,'')
  end

end


