module Push
  class FeedbackApns < Push::Feedback
    attr_accessible :app, :device, :follow_up, :failed_at if defined?(ActiveModel::MassAssignmentSecurity)
    validates_format_of :device, :with => /\A[a-z0-9]{64}\z/
    validates_inclusion_of :follow_up, :in => %w(delete), :message => "%{value} is not a valid follow-up"
  end
end