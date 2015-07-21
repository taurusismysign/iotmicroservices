# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

Category.delete_all

Category.create(name: 'Sports', category_string: 'sports', description: 'All the accounts of Sports celebrity')
Category.create(name: 'Tech', category_string: 'tech', description: 'All the accounts of Tech Wiz')
Category.create(name: 'Health', category_string: 'health', description: 'All the accounts of Health Masters')
Category.create(name: 'Comedy', category_string: 'comedy', description: 'All the accounts of Comedy Kings')

Expert.delete_all

Expert.create(handle: 'taurusismysign', category_string: 'tech')
Expert.create(handle: 'BenedictEvans', category_string: 'tech')
Expert.create(handle: 'AlecMuffett', category_string: 'tech')
Expert.create(handle: 'fmanjoo', category_string: 'tech')
Expert.create(handle: 'Techmeme', category_string: 'tech')
Expert.create(handle: 'timoreilly', category_string: 'tech')


Expert.create(handle: 'SInow', category_string: 'sports')
Expert.create(handle: 'darrenrovell', category_string: 'sports')
Expert.create(handle: 'Hlas', category_string: 'sports')


Expert.create(handle: 'MayoClinic', category_string: 'health')
Expert.create(handle: 'USDAFoodSafety', category_string: 'health')
Expert.create(handle: 'bbchealth', category_string: 'health')
Expert.create(handle: 'WebMD', category_string: 'health')
Expert.create(handle: 'WSJhealth', category_string: 'health')
Expert.create(handle: 'runnersworld', category_string: 'health')


Expert.create(handle: 'biorhythmist', category_string: 'comedy')
Expert.create(handle: 'ColinHanks', category_string: 'comedy')
Expert.create(handle: 'JohnCleese', category_string: 'comedy')
Expert.create(handle: 'rickygervais', category_string: 'comedy')
Expert.create(handle: 'ConanOBrien', category_string: 'comedy')
Expert.create(handle: 'TFLN', category_string: 'comedy')

