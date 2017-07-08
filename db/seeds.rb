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
  {name: 'Coffee'},
  {name: 'Beer'},
  {name: 'Book'},
  {name: 'Dessert'},
  # {name: 'Children'},
  # {name: 'Laundry'},
  # {name: 'Secondary storage'},
  # {name: 'Bathroom'},
  # {name: 'Lighting'},
  # {name: 'Decoration'},
  # {name: 'Textiles & Rugs'},
  # {name: 'Cooking'},
  # {name: 'Eating'},
  ])

  # 2.times do
  #   Store.create(
  #     name: Faker::Company.name,
  #     location: Faker::Address.city
  #   )
  # end
  stores = Store.create([
    { name: 'SuperStore', street_address: '350 SE Marine Dr', city: 'Vancouver', province: 'BC', postal_code: 'V5X 2S5',},
    { name: 'London Drugs', street_address: '710 Granville St', city: 'Vancouver', province: 'BC', postal_code: 'V6Z 1E4'},
    { name: 'Rexall', street_address: '6580 Fraser St', city: 'Vancouver', province: 'BC', postal_code: 'V5X 3T3'},
    ])

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

  # 300.times do
  #   price = rand(1000)
  #   Item.create name: Faker::Food.ingredient,
  #               description: Faker::Hipster.paragraph,
  #               price: price,
  #               sale_price: price,
  #               quantity: rand(500),
  #               category: Category.all.sample
  # end



  categories = [
    [ Category.where(name: 'Food')],
    [ Category.where(name: 'Coffee')],
    [ Category.where(name: 'Beer')],
    [ Category.where(name: 'Book')],
    [ Category.where(name: 'Dessert')],
  ]

  categories.each do |cat|
    puts cat[0].first.name
    30.times do

      price = rand(100)
      actualCategory = cat[0].first

      # def fakeName(name)
      #   fakeName = [Faker::Food.ingredient, Faker::Food.spice, Faker::Food.measurement].sample if name == 'Food'
      #   fakeName = [Faker::Coffee.variety, Faker::Coffee.blend_name, Faker::Coffee.origin].sample if name == 'Coffee'
      #   fakeName = [Faker::Beer.malts, Faker::Beer.name, Faker::Beer.yeast, Faker::Beer.hop].sample if name == 'Beer'
      #   fakeName = [Faker::Book.title, Faker::Book.genre].sample  if name == 'Book'
      #   fakeName = [Faker::Dessert.variety, Faker::Dessert.topping, Faker::Dessert.flavor].sample if name == 'Dessert'
      # end

      case cat[0].first.name
      when 'Food'
        fakeName = [Faker::Food.ingredient, Faker::Food.spice].sample
      when 'Coffee'
        fakeName = [Faker::Coffee.variety, Faker::Coffee.blend_name, Faker::Coffee.origin].sample
      when 'Beer'
        fakeName = [Faker::Beer.malts, Faker::Beer.name, Faker::Beer.yeast, Faker::Beer.hop].sample
      when 'Book'
        fakeName = [Faker::Book.title, Faker::Book.genre].sample
      else
        fakeName = [Faker::Dessert.variety, Faker::Dessert.topping, Faker::Dessert.flavor].sample
      end

      # fakeName = cat[0]
      Item.create name: fakeName,
                  description: Faker::Hipster.paragraph,
                  price: price,
                  sale_price: price,
                  quantity: rand(500),
                  category: actualCategory
    end
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
  # Store.all.each do |store|
  #   item = store.items.first
  #   store.aisles.each do |aisle|
  #     aisle.rows.each do |row|
  #       row.shelves.each_with_index do |shelf, counter|
  #         if counter < Item.count
  #           ShelfItem.create(
  #               item: item,
  #               shelf: shelf
  #           )
  #           item = item.next
  #           break if Item.last
  #         end
  #       end
  #     end
  #   end
  # end


  Store.all.each do |store|
    shelves = store.shelves
    store.items.each_with_index do |item, idx|
      shelf = shelves[idx]
      ShelfItem.create(
          item: item,
          shelf: shelf
      )
    end
  end

  # itemsPerShelf = 3
  # Store.all.each do |store|
  #   itemCount = store.items.count
  #   shelfCount = itemCount / itemsPerShelf
  #   shelves = store.shelves.first(shelfCount)
  #   store.items.each_with_index do |item, idx|
  #     shelf = shelves[idx % shelfCount]
  #     ShelfItem.create(
  #         item: item,
  #         shelf: shelf
  #     )
  #   end
  # end
