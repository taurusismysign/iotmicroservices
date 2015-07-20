# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Category.delete_all

Category.create(name: 'Sports', category_string: 'sports', description: 'All the accounts of Sports celebrity')
Category.create(name: 'Tech', category_string: 'tech', description: 'All the accounts of Tech Wiz')
Category.create(name: 'Health', category_string: 'health', description: 'All the accounts of Health Masters')
Category.create(name: 'Comedy', category_string: 'comedy', description: 'All the accounts of Comedy Kings')

Expert.delete_all

Expert.create(handle: 'taurusismysign', category_string: 'tech')
Expert.create(handle: 'SInow', category_string: 'sports')
Expert.create(handle: 'MayoClinic', category_string: 'health')
Expert.create(handle: 'biorhythmist', category_string: 'comedy')


