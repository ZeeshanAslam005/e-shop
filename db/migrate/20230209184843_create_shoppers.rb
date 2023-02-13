# frozen_string_literal: true

class CreateShoppers < ActiveRecord::Migration[7.0]
  def change
    create_table :shoppers do |t|
      t.string :name, null: false #name can't be blank
      t.string :email, null: false, index: { unique: true } #email can't be blank and must unique
      t.string :nif, null: false #nif can't be blank

      t.timestamps
    end
  end
end
