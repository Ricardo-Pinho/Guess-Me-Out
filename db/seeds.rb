# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Component.delete_all
Componenttype.delete_all


Component.create([{name: 'Hair'}, {name: 'HairColor'}, {name: 'Skin'}, {name: 'EyeColor'}, {name: 'Moustache'}, {name: 'Nose'}, {name: 'Mouth'}, {name: 'Shirt'}, {name: 'ShirtColor'}])

Componenttype.create!(:component_id=> 1, :name => 'Emo', :color => 1, :price => 0, :svg => '<path id="path21" fill="#000000" d="M163.119,32.668c-17.314,12.758-25.625,27.953-40.097,72.902 c-6.365,19.772-3.645,28.249-5.468,47.386c-1.63,17.117,8.202,59.233,8.202,59.233l11.847-15.491l7.29,18.226l15.491-43.742 l-2.733,41.008c13.053-29.166,13.95-65.626,39.185-87.482c10.297,27.394,8.693,56.771,4.557,86.571 c12.418-24.067,23.987-29.196,20.959-78.37c0.821,25.212,2.57,50.424,4.557,75.636c9.545-28.271,9.275-57.77,36.451-83.837 c12.035,14.201,13.144,37.77,8.201,66.523c13.728-13.932,24.954-29.649,21.871-55.588c10.242,0,3.037,85.709,2.733,89.305 c-0.681,8.081,24.397-98.495,10.024-103.886c8.087,13.366,18.131,23.602,14.58,55.588c10.434-2.839,19.234-4.046,20.049,2.734 c7.37,13.669,4.766,27.338,5.468,41.007l12.758-46.475l-14.581,86.571l23.693-51.942l-9.112,77.458l20.048-41.008l5.468,58.322 c0,0,24.604-77.459,20.048-136.691c-4.557-59.233-26.476-105.367-38.273-119.378c-29.161-34.628-59.284-14.401-53.766-17.313 c3.454-1.823-6.716-13.67-24.604-16.403c-17.518-1.907-31.128-5.78-65.612-0.911C194.179,16.598,189.716,16.448,163.119,32.668 L163.119,32.668z"/>')

Componenttype.create!(:component_id=> 1, :name => 'Bald', :color => 2, :price => 0, :svg => '')

Componenttype.create!(:component_id=> 2, :name => 'Blond', :color => 1, :price => 0, :svg => '#E6B45E')

Componenttype.create!(:component_id=> 2, :name => 'Black', :color => 2, :price => 0, :svg => '#000000')

Componenttype.create!(:component_id=> 3, :name => 'Light', :color => 1, :price => 0, :svg => '#FFD3B3')

Componenttype.create!(:component_id=> 3, :name => 'Dark', :color => 2, :price => 0, :svg => '#A16742')

Componenttype.create!(:component_id=> 4, :name => 'Black', :color => 1, :price => 0, :svg => '#000000')

Componenttype.create!(:component_id=> 4, :name => 'Blue', :color => 2, :price => 0, :svg => '#4186D3')

Componenttype.create!(:component_id=> 4, :name => 'Brown', :color => 3, :price => 0, :svg => '#884A2B')

Componenttype.create!(:component_id=> 4, :name => 'Engineering', :color => 4, :price => 0, :svg => '#8B2C18')

Componenttype.create!(:component_id=> 4, :name => 'Green', :color => 5, :price => 0, :svg => '#439400')

Componenttype.create!(:component_id=> 5, :name => 'Moustache', :color => 1, :price => 0, :svg => '<path id="path5370" fill="#111111" d="M195.013,241.351c-24.604-8.657-25.395-6.908-36.451,0c-4.507,2.815-1.367,3.189-1.367,3.189 s16.858,14.125,36.907,17.314c20.048,3.189,65.156-5.468,65.156-5.468S258.027,237.599,195.013,241.351L195.013,241.351z"/><path id="path5382" fill="#111111" d="M176.788,283.27c0,0,1.822,4.556,10.024,5.468c8.201,0.911,15.035-0.912,15.035-0.912 s-11.846,19.593-17.77,18.226C178.29,304.715,176.788,283.27,176.788,283.27z"/>')

Componenttype.create!(:component_id=> 5, :name => 'No Moustache', :color => 2, :price => 0, :svg => '')

Componenttype.create!(:component_id=> 6, :name => 'Normal', :color => 1, :price => 0, :svg => '<path id="path3891-9" fill="#513421" d="M209.737,187.787c0,0-3.931,13.925-6.063,20.6c-1.037,3.246-14.592,20.881-13.559,23.807c1.032,2.927,22.72,4.819,22.72,4.819s3.786-21.515,3.098-28.571S209.737,187.787,209.737,187.787z"/>')

Componenttype.create!(:component_id=> 7, :name => 'Normal Mouth', :color => 1, :price => 0, :svg => '<path id="Mouth-0" fill="#FFFFFF" fill-opacity="0.9647" d="M265.841,260.849c0,0-61.926,13.35-73.421,12.236 c-11.495-1.112-35.969-22.248-35.969-22.248s17.799,28.923,33.744,31.519C206.139,284.951,265.841,260.849,265.841,260.849z"/>')

Componenttype.create!(:component_id=> 8, :name => 'Plain ', :color => 1, :price => 0, :svg => '<path id="path25" fill="#C42C2C" d="M76.5,487.5c0,0-5-28,13.5-59s63.391-50.771,87.03-58.061 c23.47-7.238,36.53-13.172,36.53-13.172s-3.277,9.646-6.939,27.556C202.589,404.546,215.5,417,232.5,417.5s48.744-6.983,73.854-22.5 c24.494-15.138,37.432-42.771,37.237-43.207c0,0,11.208,10.894,24.247,16.01c23.03,9.036,45.359,18.337,62.161,31.697 c16.9,13.438,45.613,58.53,49.401,76.917c0.195,0.947-53.109,22.958-81.401,37.083L113,513L76.5,487.5z"/>')

Componenttype.create!(:component_id=> 9, :name => 'Blue', :color => 1, :price => 0, :svg => '#266EBC')

Componenttype.create!(:component_id=> 9, :name => 'Red', :color => 2, :price => 0, :svg => '#9B1010')