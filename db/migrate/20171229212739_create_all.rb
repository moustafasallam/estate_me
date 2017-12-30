class CreateAll < ActiveRecord::Migration
  def change
    create_table :real_estates do |t|
      t.string :name
      t.string :estate_type
      t.string :street, default: ""
      t.string :zip, default: ""
      t.float :latitude, default: 0.0
      t.float :longitude, default: 0.0
      t.float :sq_ft, default: 0.0
      t.float :price, default: 0.0
      t.datetime :sale_date
      t.integer :baths
      t.integer :beds
      t.integer :city_id, default: 0
      t.timestamps null: false
    end

    add_index :real_estates, [:city_id]

    create_table :countries do |t|
      t.string :name
      t.string :alpha2
      t.timestamps null: false
    end

    create_table :states do |t|
      t.string :name
      t.string :alpha2
      t.integer :country_id
      t.timestamps null: false
    end

    add_index :states, [:country_id]

    create_table :cities do |t|
      t.string :name
      t.integer :state_id
      t.timestamps null: false
    end

    add_index :cities, [:state_id]

  end
end
