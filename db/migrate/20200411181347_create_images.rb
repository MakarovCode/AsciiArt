class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :code
      t.string :source
      t.text :art

      t.timestamps
    end
  end
end
