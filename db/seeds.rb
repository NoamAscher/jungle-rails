# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Seeding Data ..."

# Helper functions
def open_asset(file_name)
  File.open(Rails.root.join('db', 'seed_assets', file_name))
end

# Only run on development (local) instances not on production, etc.
unless Rails.env.development?
  puts "Development seeds only (for now)!"
  exit 0
end

# Let's do this ...

## CATEGORIES

puts "Finding or Creating Categories ..."

cat1 = Category.find_or_create_by! name: 'Apparel'
cat2 = Category.find_or_create_by! name: 'Electronics'
cat3 = Category.find_or_create_by! name: 'Furniture'

## PRODUCTS

puts "Re-creating Products ..."

Product.destroy_all

cat1.products.create!({
  name:  'Men\'s Classy shirt',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel1.jpg'),
  quantity: 10,
  price: 64.99
})

cat1.products.create!({
  name:  'Women\'s Zebra pants',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel2.jpg'),
  quantity: 18,
  price: 124.99
})

cat1.products.create!({
  name:  'Hipster Hat',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel3.jpg'),
  quantity: 4,
  price: 34.49
})

cat1.products.create!({
  name:  'Hipster Socks',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel4.jpg'),
  quantity: 8,
  price: 25.00
})

cat1.products.create!({
  name:  'Russian Spy Shoes',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel5.jpg'),
  quantity: 8,
  price: 1_225.00
})

cat1.products.create!({
  name:  'Human Feet Shoes',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel6.jpg'),
  quantity: 82,
  price: 224.50
})


cat2.products.create!({
  name:  'Modern Skateboards',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics1.jpg'),
  quantity: 40,
  price: 164.49
})

cat2.products.create!({
  name:  'Hotdog Slicer',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics2.jpg'),
  quantity: 3,
  price: 26.00
})

cat2.products.create!({
  name:  'World\'s Largest Smartwatch',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics3.jpg'),
  quantity: 32,
  price: 2_026.29
})

cat3.products.create!({
  name:  'Optimal Sleeping Bed',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture1.jpg'),
  quantity: 320,
  price: 3_052.00
})

cat3.products.create!({
  name:  'Electric Chair',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture2.jpg'),
  quantity: 2,
  price: 987.65
})

cat3.products.create!({
  name:  'Red Bookshelf',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture3.jpg'),
  #quantity: 23,
  quantity: 0,
  price: 2_483.75
})

puts "Creating reviews ..."
Review.create :product_id => 1, :user_id => 1, :description => "hi!", :rating => 4, :created_at => nil, :updated_at => nil

Review.create :product_id => 5, :user_id => 7, :description => "Not Russian Spy Shoes!!!! Nyeeeeet!!", :rating => 2

Review.create :product_id => 4, :user_id => 6, :description => "Best socks ever (really, evarr)", :rating => 5

Review.create :product_id => 3, :user_id => 5, :description => "Nice hat, but hipster not included.", :rating => 3

# Review.create!({
#   product_id: 1,
#   user_id: 1,
#   description: "hi!",
#   rating: 4
# })

# Review.create!({
#   product_id: 5,
#   user_id: 7,
#   description: "Not Russin Spy Shoes!!!! Nooo!",
#   rating: 2
# })

# Review.create!({
#   product_id: 4,
#   user_id: 6,
#   description: "Best socks ever. Ever.",
#   rating: 5
# })

# Review.create!({
#   product_id: 3,
#   user_id: 5,
#   description: "Nice hat, but hipster not included.",
#   rating: 3
# })




puts "Creating users ..."

User.create!({
  firstname: "don",
  lastname: "burks",
  email: "don@lighthouselabs.ca",
  password_digest: "$2a$10$b.DgQrzfLizczmnfm1UXyeA6JnSmZ1zkXvFfwmp//6k5YISpga.Wq",
  created_at: "2016-11-15 23:19:24",
  updated_at: "2016-11-15 23:19:24"
})

User.create!({
  firstname: "Khurram",
  lastname: "Virani",
  email: "khurram@gmail.com",
  password_digest: "$2a$10$7x0MqyD3873ydy.unMwMHufr4d6uAA/h3BhzFLicix3pABxUvhbIq",
  created_at: "2016-11-16 00:00:38",
  updated_at: "2016-11-16 00:00:38"
})

User.create!({
  firstname: "Bugs",
  lastname: "Bunny",
  email: "bugs@looney.toons",
  password_digest: "$2a$10$nNXoA0U3AXf2kRvJI.PnQeIBpYBofMeMoIOlMvZ0eoZtpKTYd/Zqa",
  created_at: "2016-11-19 20:06:14",
  updated_at: "2016-11-19 20:06:14"
})

User.create!({
  firstname: "Khurram",
  lastname: "Virani",
  email: "khurram@gmail.com",
  password_digest: "$2a$10$7oa4MuggDL50laP.LHSJ6..2ntRRiN3Q1wYs26wrjC6Zc.GX.tE0C",
  created_at: "2016-11-21 19:41:24",
  updated_at: "2016-11-21 19:41:24"
})

User.create!({
  firstname: "Khurram",
  lastname: "Virani",
  email: "khurram@gmail.com",
  password_digest: "$2a$10$n2l7aX4iLxLXxHwq/7XrTeo.W49zV/zMEfOuyH8CtYTzZqZBGQk.e",
  created_at: "2016-11-21 19:47:09",
  updated_at: "2016-11-21 19:47:09"
})

User.create!({
  firstname: "Khurram",
  lastname: "Virani",
  email: "khurram@gmail.com",
  password_digest: "$2a$10$WcHkO2qu2Q53dI.uR/zfaOJBs8OkgB7V2hTVUSnU.n/BkD89jNYsa",
  created_at: "2016-11-21 19:53:04",
  updated_at: "2016-11-21 19:53:04"
})

User.create!({
  firstname: "Khurram",
  lastname: "Virani",
  email: "khurram@gmail.com",
  password_digest: "$2a$10$AoMEnOVRUonIv6a6vu5We.pjxbPtcIZopbm.BFufr1sT2F6j9bT4K",
  created_at: "2016-11-21 20:34:04",
  updated_at: "2016-11-21 20:34:04"
})

User.create!({
  firstname: "Khurram",
  lastname: "Virani",
  email: "khurram@gmail.com",
  password_digest: "$2a$10$.03swLSjz/dMy4Xcw0cfTuMKUCfj8jWnvLOo4ZHHyNx.B/pQ4B4c6",
  created_at: "2016-11-21 20:54:24",
  updated_at: "2016-11-21 20:54:24"
})

User.create!({
  firstname: "Khurram",
  lastname: "Virani",
  email: "khurram@gmail.com",
  password_digest: "$2a$10$RCWolhTt3/HdBvZe2sHiJu9/8tAjy2a4NLcAPc6prbLgM0wrgfoEe",
  created_at: "2016-11-21 20:54:55",
  updated_at: "2016-11-21 20:54:55"
})

User.create!({
  firstname: "Khurram",
  lastname: "Virani",
  email: "khurram@gmail.com",
  password_digest: "$2a$10$hp5BYi8I0fVxQB5furi0Eeaiyl9yVLexXguJ61XJmmItWva.ZrdT6",
  created_at: "2016-11-21 20:55:09",
  updated_at: "2016-11-21 20:55:09"
})


#User id: 1, firstname: "don", lastname: "burks", #email: "don@lighthouselabs.ca",
#password_digest: "$2a$10$b.DgQrzfLizczmnfm1UXyeA6JnSmZ1zkXvFfwmp//6k...",
#created_at: "2016-11-15 23:19:24", updated_at: "2016-11-15 23:19:24">,
#<User id: 4, firstname: "Khurram", lastname: "Virani", email: "khurram@gmail.com",
#password_digest: "$2a$10$7x0MqyD3873ydy.unMwMHufr4d6uAA/h3BhzFLicix3...",
#created_at: "2016-11-16 00:00:38", updated_at: "2016-11-16 00:00:38">,
#<User id: 5, firstname: "Bugs", lastname: "Bunny", email: "bugs@looney.toons",
#password_digest: "$2a$10$nNXoA0U3AXf2kRvJI.PnQeIBpYBofMeMoIOlMvZ0eoZ...",
#created_at: "2016-11-19 20:06:14", updated_at: "2016-11-19 20:06:14">,
#<User id: 6, firstname: "Khurram", lastname: "Virani", email: "khurram@gmail.com",
#password_digest: "$2a$10$7oa4MuggDL50laP.LHSJ6..2ntRRiN3Q1wYs26wrjC6...",
#created_at: "2016-11-21 19:41:24", updated_at: "2016-11-21 19:41:24">,
#<User id: 7, firstname: "Khurram", lastname: "Virani", email: "khurram@gmail.com",
#password_digest: "$2a$10$n2l7aX4iLxLXxHwq/7XrTeo.W49zV/zMEfOuyH8CtYT...",
#created_at: "2016-11-21 19:47:09", updated_at: "2016-11-21 19:47:09">,
#<User id: 8, firstname: "Khurram", lastname: "Virani", email: "khurram@gmail.com",
#password_digest: "$2a$10$WcHkO2qu2Q53dI.uR/zfaOJBs8OkgB7V2hTVUSnU.n/...",
#created_at: "2016-11-21 19:53:04", updated_at: "2016-11-21 19:53:04">,
#<User id: 9, firstname: "Khurram", lastname: "Virani", email: "khurram@gmail.com",
#password_digest: "$2a$10$AoMEnOVRUonIv6a6vu5We.pjxbPtcIZopbm.BFufr1s...",
#created_at: "2016-11-21 20:34:04", updated_at: "2016-11-21 20:34:04">,
#<User id: 10, firstname: "Khurram", lastname: "Virani", email: "khurram@gmail.com",
#password_digest: "$2a$10$.03swLSjz/dMy4Xcw0cfTuMKUCfj8jWnvLOo4ZHHyNx...",
#created_at: "2016-11-21 20:54:24", updated_at: "2016-11-21 20:54:24">,
#<User id: 11, firstname: "Khurram", lastname: "Virani", email: "khurram@gmail.com",
#password_digest: "$2a$10$RCWolhTt3/HdBvZe2sHiJu9/8tAjy2a4NLcAPc6prbL...",
#created_at: "2016-11-21 20:54:55", updated_at: "2016-11-21 20:54:55">,
#<User id: 12, firstname: "Khurram", lastname: "Virani", email: "khurram@gmail.com",
#password_digest: "$2a$10$hp5BYi8I0fVxQB5furi0Eeaiyl9yVLexXguJ61XJmmI...",
#created_at: "2016-11-21 20:55:09", updated_at: "2016-11-21 20:55:09">#



puts "DONE!"
