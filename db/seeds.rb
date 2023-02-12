# frozen_string_literal: true

merchants = JSON.parse(File.read(Rails.root.join('db', 'seeds', 'merchants.json'), symbolize_names: true))
Merchant.create!(merchants['RECORDS'])

shoppers = JSON.parse(File.read(Rails.root.join('db', 'seeds', 'shoppers.json'), symbolize_names: true))
Shopper.create!(shoppers['RECORDS'])

orders = JSON.parse(File.read(Rails.root.join('db', 'seeds', 'orders.json'), symbolize_names: true))
Order.create!(orders['RECORDS'])

Disbursement.disburse!