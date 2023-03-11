class CreateCitizens < ActiveRecord::Migration[6.1]
  def change
    create_table :citizens do |t|
      t.boolean :status
      t.string :first_name
      t.string :last_name
      t.string :cpf
      t.string :cns
      t.string :email
      t.date :date_of_birth
      t.string :telephone

      t.timestamps
    end
  end
end
