class DbcApi

  def self.get_grads
    grads = DBC::User.all

    grads.each do |grad|
      url = grad.profile[:linked_in]
      if url && url != ""
        url = url.slice(URI.regexp).gsub(/\/$/, "")
          if !(url =~ /^https?:/i)
            url = "http://" + url
          end
      else
        url = nil
      end

      image = Gravatar.new(grad.email).image_url
      Graduate.create(cohort_id: grad.cohort_id, name: grad.name, email: grad.email, linked_in: url, picture: image)
    end
      puts Graduate.all.count
  end

  def self.get_cohort
    cohort = DBC::Cohort.all

    cohort.each do |cohort|
      Cohort.create(id: cohort.id, campus: cohort.location, start_date: cohort.start_date)
    end
    puts Cohort.all.count
  end

end
