class CreateNewsSubscribers < ActiveRecord::Migration[5.0]
  def change
    create_table :news_subscribers do |t|
      t.string :email
      t.references :crew, foreign_key: true

      t.timestamps
    end
  end
end
