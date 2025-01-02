# create menus
pizza = Menu.create(name: 'Pizza')
drinks = Menu.create(name: 'Drinks')

# create menu items
MenuItem.create([
  { name: 'Marguerita', description: 'Mussarela, Tomate, Manjericão', price: 8.99, menu: pizza },
  { name: 'Pepperoni', description: 'Mussarela, Pepperoni', price: 9.99, menu: pizza },
  { name: 'Coca-Cola', description: 'Coca-Cola', price: 1.99, menu: drinks },
  { name: 'Guaraná', description: 'Guaraná', price: 1.99, menu: drinks },
  { name: 'Fanta', description: 'Fanta', price: 1.99, menu: drinks },
  { name: 'Água', description: 'Água', price: 0.99, menu: drinks }
])

# create users
waiter = User.create!(email: 'waiter@example.com', password: 'password', role: 'waiter')
manager = User.create!(email: 'manager@example.com', password: 'password', role: 'manager')
admin = User.create!(email: 'admin@example.com', password: 'password', role: 'admin')


# create tables
(1..10).each { |i| Table.create(number: i, status: 'free', user_id: waiter.id) }
