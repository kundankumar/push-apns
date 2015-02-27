class Tableless < ActiveRecord::Base
  
    def self.columns
      @columns ||= [];
    end
 
    def self.column(name, sql_type = nil, default = nil, null = true)
      columns << ActiveRecord::ConnectionAdapters::Column.new(name.to_s, default, sql_type.to_s, null)
    end
    
    def self.inspect
      "#<#{ self.to_s } #{ columns.collect{ |c| "#{c.name.to_s}: #{c.type.to_s}"  }.join(' ') }>"
    end
 
    def save(validate = true)
      validate ? valid? : true
    end
    
end

module Push
  module Apns
    class BinaryNotificationValidator < Tableless

      def validate(record)
        if record.payload_size > 256
          record.errors[:base] << "APN notification cannot be larger than 256 bytes. Try condensing your alert and device attributes."
        end
      end
    end
  end
end