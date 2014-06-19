FactoryGirl.define do
  factory :graduate do
    name { "Tyler Waneka" }
    cohort
    location {"San Francisco Bay Area"}
  end
  factory :cohort do
    campus {"San Francisco"}
    id {"1"}
    start_date {"2014-1-1"}
  end
end
