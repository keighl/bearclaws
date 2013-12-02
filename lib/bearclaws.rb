require 'csv'
require 'bearclaws/group'
require 'bearclaws/record'

module Bearclaws

  def self.analyze(csv_path = nil, group_column = nil)

    raise "No CSV path supplied!" unless csv_path
    raise "No CSV group column supplied!" unless group_column
    raise "Group column must be an integer!" unless group_column.is_a? Integer

    groups = { default: Bearclaws::Group.new(:default) }

    rows = CSV.read csv_path

    rows.shift(2) # remove instructions, column labels
    rows.pop(3)   # remove subtotal, total, footer

    rows.each do |row|
      name = (row[group_column].nil?) ? :default : row[group_column]
      groups[name] ||= Bearclaws::Group.new(name.to_sym)
      groups[name].records << Bearclaws::Record.new(row)
    end

    return groups.collect { |k, v| v }
  end
end
