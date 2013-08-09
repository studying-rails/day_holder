class CreateFreezeClocks < ActiveRecord::Migration
  def change
    create_table :freeze_clocks do |t|
      t.date :now, null: false

      t.timestamps
    end
  end
end
