class CreateElmusaltahos < ActiveRecord::Migration
  def change
    create_table :elmusaltahos do |t|

      t.timestamps null: false
    end
  end
end
