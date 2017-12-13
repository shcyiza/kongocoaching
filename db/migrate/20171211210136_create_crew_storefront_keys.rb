class CreateCrewStorefrontKeys < ActiveRecord::Migration[5.0]
  def change
    create_table :crew_storefront_keys do |t|
      t.references :crew, foreign_key: true
      t.string :public_key
      t.string :secret_key

      t.timestamps
    end
  end
end
