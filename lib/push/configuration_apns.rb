module Push
  class ConfigurationApns < Push::Configuration
    serialize :properties, Hash # :accessors => [:certificate, :certificate_password, :sandbox, :feedback_poll, :skip_check_for_error]
    attr_accessible :app, :enabled, :connections, :certificate, :certificate_password, :sandbox, :feedback_poll if defined?(ActiveModel::MassAssignmentSecurity)
    #validates_presence_of :certificate
    #validates_inclusion_of :sandbox, :in => [true, false]
    #validates_presence_of :feedback_poll, :presence => true
    #validates_inclusion_of :skip_check_for_error, :in => [true, false], :allow_blank => true

    def name
      :apns
    end
  end
end