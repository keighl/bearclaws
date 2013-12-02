require 'csv'
require 'bearclaws/group'
require 'bearclaws/charge'

module Bearclaws

  # Analyze the output of you AWS cost allocation report. Group your costs by an arbitrary tag, like 'client'
  #
  # http://aws.amazon.com/about-aws/whats-new/2012/08/21/aws-billing-enables-cost-allocation-reports/
  #
  # @param file [File] a CSV of allocated AWS charges (i.e., 937951391671-aws-cost-allocation-2013-09.csv)
  # @param tag_column [Integer] The zero-indexed column number in the CSV that holds the tag you want to group by
  # @return [Array] A set of Bearclaws::Group objects grouped by tag
  def self.analyze(file = nil, tag_column = nil)

    raise "No file supplied!" unless file
    raise "No CSV group column supplied!" unless tag_column
    raise "Group column must be an integer!" unless tag_column.is_a? Integer

    groups = { default: Bearclaws::Group.new(:default) }

    rows = CSV.parse file.read

    rows.shift(2) # remove instructions, column labels
    rows.pop(3)   # remove subtotal, total, footer

    rows.each do |row|
      name = (row[tag_column].nil?) ? :default : row[tag_column]
      groups[name] ||= Bearclaws::Group.new(name.to_sym)
      groups[name].charges << Bearclaws::Charge.new(row)
    end

    return groups.collect { |k, v| v }
  end
end
