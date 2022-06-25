class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.string :text
      t.boolean :read, default: false
      t.references :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
