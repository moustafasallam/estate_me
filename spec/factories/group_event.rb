FactoryGirl.define do
  factory :group_event do
  	id						    { rand(1234567..9999999) }
  	name  				    { "my_event" }
    description       { Faker::Lorem.sentences(3) }
    state             { "draft" }
    location          {"Cairo, Egypt"}
    start_date        { Time.now }
    end_date          { Time.now + 2.days }


	  trait :published do
	    state "published"
	  end

	  trait :less_end_date do
	  	end_date {start_date - 2.days}
		end

		trait :past_start_date do
	  	start_date {Time.now.to_date - 2.days}
		end

	  factory :published_event, traits: [:published]
	  factory :end_event, traits: [:published, :less_end_date]
	  factory :past_event, traits: [:published, :past_start_date]
  end


end

