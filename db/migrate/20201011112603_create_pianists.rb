class CreatePianists < ActiveRecord::Migration[6.0]
  def change
    create_table :pianists do |t|
      t.text       :school,  null: false
      t.text       :repert,  null: false
      t.text       :area,    null: false
      t.text       :money,   null: false
      t.text       :message
      t.text       :video
      t.references :user,    null: false,  foreign_key: true
      t.timestamps
    end
  end
end
