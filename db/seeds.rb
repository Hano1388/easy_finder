# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
  Category.destroy_all
  # Item.destroy_all
  # ItemReview.destroy_all
  Store.destroy_all
  Aisle.destroy_all

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

  10.times do
    Store.create([
    { name: Faker::Company.name },
    {location: Faker::Address.city},
    ])
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



  # for( let i = 0; i < 10; i++) {
  #   Store.create([
  #     {name: Faker::Company.name},
  #     {location: Faker::Address.city},
  #     # {latitude: Faker::Address.latitude},
  #     # {longitude: Faker::Address.longitude},
  #     ])
  #     for( let j = 1; j < 20; j++){
  #       Aisle.create([
  #         { aisle_number: j },
  #         { aisle_side: if(j < 10) ? 'Right' : 'Left' },
  #         { store: Store.last },
  #         ])
  #         for( let k = 1; k < 10; k++ ){
  #           Row.create([
  #             { row_number: k },
  #             { aisle: Aisle.last },
  #             ])
  #             for( let l = 0; l < 20; l++){
  #               Shelf.create([
  #                 { shelf_number: l },
  #                 { row: Row.last },
  #                 ])
  #             }
  #         }
  #     }
  # }

  # 15.times do
  #   Item.create name: Faker::Food.sample[ingredient,spice, measurement],
  #               description: Faker.Hipster.paragraph,
  #               price: rand(1000),
  #               sale_price: price,
  #               quantity: rand(500),
  #               category: category.sample,
  #               shelf: shelf.sample
  # end
