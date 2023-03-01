class CreateProspects < ActiveRecord::Migration[7.0]
  def change
    create_table :prospects do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.integer :probability
      t.references :company, foreign_key: true
      t.references :stage, foreign_key: true

      t.timestamps
    end
  end
end
