# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# create_table "Cats", force: :cascade do |t|
#     t.date "birth_date", null: false
#     t.string "color", null: false
#     t.string "name", null: false
#     t.string "sex", limit: 1
#     t.text "description", null: false
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#   end

# validates :color, inclusion: {  in: %w[black white speckled calico orange] }
# validates :sex, inclusion: { in: ['M', 'F', 'N'] }


  Cat.destroy_all  


  Cat.create!(:birth_date => '1990-05-26', :color => 'black', :name => 'freckles', :sex => 'M', :description => 'black, tall, beets')
  Cat.create!(:birth_date => '1985-06-01', :color => 'calico', :name => 'lilly', :sex => 'F', :description => 'loves jumping around')
  Cat.create!(:birth_date => '1970-07-01', :color => 'white', :name => 'monster', :sex => 'F', :description => 'really scary face but very sweet')
  Cat.create!(:birth_date => '1971-01-17', :color => 'speckled', :name => 'aaron', :sex => 'F', :description => 'pronounced a-a-ron')
  Cat.create!(:birth_date => '1995-04-26', :color =>'calico' , :name => 'kareem', :sex => 'M', :description => 'hangs out at lakes all the time')
  Cat.create!(:birth_date => '1947-12-24', :color =>'black' , :name => 'dwight', :sex => 'N', :description => 'hangs out with kareem all the time')
  Cat.create!(:birth_date => '1999-11-18', :color => 'black', :name => 'alex', :sex => 'M', :description => 'roommate, smelly')
  Cat.create!(:birth_date => '2005-01-13', :color => 'calico', :name => 'brady', :sex => 'F', :description => 'hangs out with smelly')
  Cat.create!(:birth_date => '2000-07-21', :color => 'white', :name => 'hank', :sex => 'F', :description => 'has 18 children')
  Cat.create!(:birth_date => '1995-07-17', :color => 'orange', :name => 'sethb', :sex => 'N', :description => 'thats me')
