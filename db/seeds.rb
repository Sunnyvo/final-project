# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@types_list = [
  "Funny idea" ,
  "Real idea" ,
  "Project",
]

@categories_list = [
  "Technical" ,
  "Agricuture" ,
  "Learning",
  "Robotic",
  "Others",
]
if Category.count == 0
  puts "No Category! Let's create some"
  @categories_list.each do |name|
    category = Category.create(name: name)
    if category.persisted?
      puts "Saved categories with name = #{name}"
    end


    # create some food_items for each section

  end
else
  puts "Looks like you already have some categories!"
end

if Type.count==0
  puts "No Type!, Let's create some"
  @types_list.each do|name|
    type = Type.create(name: name)
    if type.persisted?
      puts "Saved types with name = #{name}"
    end
  end
else
  puts "looks like you already have some Types"
end
