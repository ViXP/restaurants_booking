restaurant1 = Restaurant.create!(
  title: 'ABCD Foods',
  description: 'The best food from all over the world',
  logo: 'https://fthmb.tqn.com/oxgZ1jI-9KNIJ9CheM5FOUd1HMA=/960x0/filters:n' \
        'o_upscale()/spinach-feta-cheese-and-mushroom-filo-triangles-871151' \
        '44-58189e3f5f9b581c0b19daca.jpg',
  website: 'http://abcdfoods.it'
)
restaurant2 = Restaurant.create!(
  title: 'Thai Food Market',
  description: 'Seafood from Thailand market & caffee',
  logo: 'http://cdn-image.foodandwine.com/sites/default/files/1480696614/se' \
        'afood-paella-XL-RECIPE0117.jpg',
  website: 'http://thaifoodmarket.th'
)
(1..10).each do |i|
  restaurant1.dining_tables.create!(number: i, quantity_of_persons: rand(1..10))
  restaurant2.dining_tables.create!(number: i, quantity_of_persons: rand(1..10))
end
(0..6).each do |i|
  restaurant1.day_schedules.find_by_day_of_week(i).update!(
    open_time: 10.hours,
    close_time: 28.hours
  )
  restaurant2.day_schedules.find_by_day_of_week(i).update!(
    open_time: 9.hours,
    close_time: 23.hours + 30.minutes
  )
end
(1..7).each do |i|
  restaurant1.dining_tables.find_by_number(i).reservations.create!(
    reserve_date: Date.today + i.days,
    reserve_start: rand(16..18).hours,
    reserve_end: rand(21..23).hours,
    reserver_name: 'Clark Griswold'
  )
  restaurant1.dining_tables.find_by_number(i).reservations.create!(
    reserve_date: Date.today + i.days,
    reserve_start: rand(10..12).hours,
    reserve_end: rand(13..16).hours,
    reserver_name: 'Ellen Griswold'
  )
  restaurant2.dining_tables.find_by_number(i).reservations.create!(
    reserve_date: Date.today + i.days,
    reserve_start: rand(9..13).hours,
    reserve_end: rand(14..16).hours,
    reserver_name: 'Rusty Griswold'
  )
  restaurant2.dining_tables.find_by_number(i).reservations.create!(
    reserve_date: Date.today + i.days,
    reserve_start: rand(16..20).hours,
    reserve_end: rand(21..23).hours,
    reserver_name: 'Audrey Griswold'
  )
end