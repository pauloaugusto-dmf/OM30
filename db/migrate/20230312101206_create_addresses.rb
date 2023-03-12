class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :zipcode
      t.string :public_place
      t.string :neighborhood
      t.string :city
      t.string :fu
      t.string :complement
      t.string :ibge_code
      t.references :citizen,        foreign_key: true

      t.timestamps
    end
  end
end
