class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.references :doctor, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :recommendation
      t.timestamps
    end
  end
end
