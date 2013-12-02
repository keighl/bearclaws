module Bearclaws

  # A grouped representation of AWS charges
  #
  # @attr name [String] The tag by which the charges are grouped
  # @attr charges [Array] An array of Bearclaws::Charge objects
  class Group
    attr_accessor :name
    attr_accessor :charges

    # @param name [String] The tag by which the charges are grouped
    # @param charges [Array] An array of Bearclaws::Charge objects
    def initialize(name, charges = [])
      self.name    = name.to_sym
      self.charges = charges
    end

    # The total cost of all the charges with group's tag
    #
    # @return [Float]
    def total
      charges.map { |x| x.total_cost.to_f }.inject(:+)
    end

    # The total costs for the tag broken out by :product_code
    #
    # @return [Float]
    def subtotals
      x = {}
      charges.each do |r|
        x[r.product_code] ||= 0.to_f
        x[r.product_code]  += r.total_cost.to_f
      end
      return x
    end
  end
end
