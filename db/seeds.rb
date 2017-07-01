# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  # Category.destroy_all
  # Store.destroy_all
  # Aisle.destroy_all
  # Row.destroy_all
  # Shelf.destroy_all
  # Item.destroy_all
  # ItemReview.destroy_all
  # StoreReview.destroy_all

categories = Category.create([
  {name: 'Food'},
  {name: 'Kitchen'},
  {name: 'Outdoor Furniture'},
  {name: 'Dining'},
  {name: 'Furniture'},
  {name: 'Children'},
  {name: 'Laundry'},
  {name: 'Secondary storage'},
  {name: 'Bathroom'},
  {name: 'Lighting'},
  {name: 'Decoration'},
  {name: 'Textiles & Rugs'},
  {name: 'Cooking'},
  {name: 'Eating'},
  ])

  2.times do
    Store.create(
      name: Faker::Company.name,
      location: Faker::Address.city
    )
  end

  counter = (1..20).to_a
  Store.all.each do |store|
    counter.each do |counter|
      Aisle.create(
                aisle_number: counter,
                store: store
        )
      end
    end

    Aisle.all.each do |aisle|
      counter = (1..10)
      counter.each do |counter|
        Row.create(
        row_number: counter,
        aisle: aisle
        )
      end
    end

    Row.all.each do |row|
      counter.each do |counter|
        Shelf.create(
        shelf_number: counter,
        row: row
        )
      end
    end

    # Shelf.all.each do |shelf|
    #   Item.create name: Faker::Food.ingredient,
    #               description: Faker::Hipster.paragraph,
    #               price: rand(1000),
    #               quantity: rand(500),
    #               category: Category.all.sample,
    #               shelf: shelf
    # end

# First create Item with categories seperately
# Second fill the StoreItem table with the same items for both stores
# Third fill the shelves randomly for each store by items

# FIRST
    300.times do
      Item.create name: Faker::Food.ingredient,
                  description: Faker::Hipster.paragraph,
                  price: rand(1000),
                  quantity: rand(500),
                  category: Category.all.sample
    end

# SECOND
Store.all.each do |store|
  Item.all.each do |item|
    StoreItem.create(
    store: store,
    item: item
    )
  end
end

# Third
# NOTE COPY THAT TO CONSOLE AND RUN IT TO FILL SHELVES WITH ITEMS FOR NOW 
  # Store.all.each do |store|
  #   item = store.items.first
  #   store.aisles.each do |aisle|
  #     aisle.rows.each do |row|
  #       row.shelves.each_with_index  do |shelf, counter|
  #         if counter < Item.count
  #           item.shelf_id = shelf.id
  #           item.save
  #           item = item.next
  #           # break unless item
  #           break if Item.last
  #         end
  #       end
  #     end
  #   end
  # end

Item.all.each do |item|
  item.update_column :sale_price, item.price
end
