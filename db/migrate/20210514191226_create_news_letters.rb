class CreateNewsLetters < ActiveRecord::Migration[5.2]
  def change
    create_table :news_letters do |t|
      t.string :email

      t.timestamps
    end
  end
end