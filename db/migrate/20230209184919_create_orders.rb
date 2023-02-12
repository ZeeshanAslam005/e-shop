# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :merchant
      t.references :shopper
      t.float :amount,  null: false
      t.datetime :completed_at

      t.timestamps
    end
  end
end
