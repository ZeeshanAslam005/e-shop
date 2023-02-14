# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :merchant #merchant has many order
      t.references :shopper #shopper has many order
      t.float :amount,  null: false #amount can't be blank
      t.datetime :completed_at

      t.timestamps
    end
  end
end
