module Bearclaws

  # The mappings for a nomal AWS cost allocation report
  AWSMAP = {
    :invoice_id => 0,
    :payer_account_id => 1,
    :linked_account_id => 2,
    :charge_type => 3,
    :charge_id => 4,
    :billing_period_start_date => 5,
    :billing_period_end_date => 6,
    :invoice_date => 7,
    :payer_account_name => 8,
    :linked_account_name => 9,
    :taxation_address => 10,
    :payer_po_number => 11,
    :product_code => 12,
    :product_name => 13,
    :seller_of_charge => 14,
    :usage_type => 15,
    :operation => 16,
    :availability_zone => 17,
    :rate_id => 18,
    :item_description => 19,
    :usage_start_date => 20,
    :usage_end_date => 21,
    :usage_quantity => 22,
    :blended_rate => 23,
    :currency_code => 24,
    :cost_before_tax => 25,
    :credits => 26,
    :tax_amount => 27,
    :tax_type => 28,
    :total_cost => 29
  }
end