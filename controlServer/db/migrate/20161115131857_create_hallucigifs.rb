class CreateHallucigifsTable < ActiveRecord::Migration
  def change
    create_table :hallucigifs do |t|
      t.string :link
      t.integer :from
      t.integer :to
      t.integer :status
    end
  end
end
