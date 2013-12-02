require 'bearclaws/mapping'

module Bearclaws

  # A representation of a charge
  class Charge

    Bearclaws::AWSMAP.each { |k, v| attr_accessor k }

    # @param charge [Array] a CSV row from an AWS cost allocation report
    def initialize(charge = [])
      Bearclaws::AWSMAP.each { |k, v|
        send "#{k}=", charge[v]
      }
    end
  end
end
