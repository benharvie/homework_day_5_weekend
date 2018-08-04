def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, amount)
  return pet_shop[:admin][:total_cash] += amount
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, amount)
  pet_shop[:admin][:pets_sold] += amount
  return pet_shop[:admin][:pets_sold]
end

def stock_count(pet_shop)
  return pet_shop[:pets].count
end

def pets_by_breed(pet_shop, breed)
  total = Array.new
  pet_shop[:pets].each { |pet| total.push(pet) if pet[:breed] == breed}
  return total
end

def find_pet_by_name(pet_shop, pet_name)
  pet_shop[:pets].each { |pet| return pet if pet[:name] == pet_name }
  return nil
end

def remove_pet_by_name(pet_shop, pet_name)
  pet_shop[:pets].each { |pet| pet_shop[:pets].delete(pet) if pet[:name] == pet_name}
end

def add_pet_to_stock(pet_shop, pet)
  pet_shop[:pets].push(pet)
end

def customer_cash(customer)
  return customer[:cash]
end

def remove_customer_cash(customer, amount)
  customer[:cash] -= amount
end

def customer_pet_count(customer)
  return customer[:pets].count
end

def add_pet_to_customer(customer, pet)
  customer[:pets].push(pet)
end

def customer_can_afford_pet(customer, pet)
  customer[:cash] >= pet[:price] ? true : false
end

def sell_pet_to_customer(pet_shop, pet, customer)
  unless pet == nil || customer_can_afford_pet(customer, pet) == false
    remove_pet_by_name(pet_shop, pet)
    add_pet_to_customer(customer, pet)
    increase_pets_sold(pet_shop, 1)
    remove_customer_cash(customer, pet[:price])
    add_or_remove_cash(pet_shop, pet[:price])
  end
end
