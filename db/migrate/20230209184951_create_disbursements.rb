# frozen_string_literal: true

class CreateDisbursements < ActiveRecord::Migration[7.0]
  def change
    create_table :disbursements do |t|
      t.references :order
      t.float :amount, null: false

      t.timestamps
    end
  end
end
