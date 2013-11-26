require 'bearclaws/mapping'

module Bearclaws
  class Record

    Bearclaws::AWSMAP.each { |k, v| attr_accessor k }

    def initialize(record = [])
      Bearclaws::AWSMAP.each { |k, v|
        send "#{k}=", record[v]
      }
    end
  end
end
