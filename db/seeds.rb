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

    Store.all.each do |store|
      store.aisles.each do |aisle|
        aisle.rows.each do |row|
          counter.each do |counter|
            Shelf.create(
            shelf_number: counter,
            row: row,
            store: store
            )
          end
        end
      end
    end

# FIRST
    300.times do
      Item.create name: Faker::Food.ingredient,
                  description: Faker::Hipster.paragraph,
                  price: rand(1000),
                  quantity: rand(500),
                  category: Category.all.sample
    end

    Item.all.each do |item|
      item.update_column :sale_price, item.price
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
  Store.all.each do |store|
    item = store.items.first
    store.aisles.each do |aisle|
      aisle.rows.each do |row|
        row.shelves.each_with_index do |shelf, counter|
          if counter < Item.count
            ShelfItem.create(
                item: item,
                shelf: shelf
            )
            item = item.next
            break if Item.last
          end
        end
      end
    end
  end