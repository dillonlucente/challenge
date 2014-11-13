class ChallengeRequest < ActiveRecord::Base
  belongs_to :person

  belongs_to :assignee, class_name: "Person"

end
