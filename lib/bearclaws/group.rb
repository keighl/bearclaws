module Bearclaws

  class Group
    attr_accessor :name
    attr_accessor :records

    def initialize(name, records = [])
      self.name    = name.to_sym
      self.records = records
    end

    def total
      records.map { |x| x.total_cost.to_f }.inject(:+)
    end

    def subtotals
      x = {}
      records.each do |r|
        x[r.product_code] ||= 0.to_f
        x[r.product_code]  += r.total_cost.to_f
      end
      return x
    end
  end
end
