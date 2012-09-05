class CreateCardNumbers < ActiveRecord::Migration
  def change
    create_table :card_numbers do |t|
      t.string :number

      t.timestamps
    end
  end
end
