class CreateEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :entries do |t|
      t.string :titulo
      t.text :bajada
      t.text :cuerpo

      t.timestamps
    end
  end
end
