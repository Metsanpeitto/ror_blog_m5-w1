# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
   User.create([{name: 'Juan', photo: 'https://imgur.9823432/', bio: 'Lots of things to say in here'},
                        {name: 'Pako', photo: 'https://imgur.98234a4532/', bio: 'Lots of things to say in here'},
                        {name: 'Resta', photo: 'https://imgur.sdasasd/', bio: 'Lots of things to say in here'}])

   Post.create([{ user_id: 1, title: 'The post1', text: 'Alkdfgjdklfgasdasdasdasd' },
                         { user_id: 1, title: 'The post2', text: 'asdfasdf' },
                         { user_id: 2, title: 'The post3', text: 'werwerwerwerwerwer' },
                         { user_id: 2, title: 'The post4', text: 'xcvbxcvbxcvb' },
                         { user_id: 2, title: 'The post5', text: 'dfgsetygtthrth' },
                         { user_id: 3, title: 'The post6', text: 'Alkdfgjdklfgasdasdasdasd' }, ])

   Comment.create([{ user_id: 1, post_id:1, text: 'Alkdfgjdklfgasdasdasdasd' },
                         { user_id: 1,post_id:2, text: 'asdfasdf' },
                         { user_id: 2,post_id:1, text: 'werwerwerwerwerwer' },
                         { user_id: 2,post_id:2, text: 'xcvbxcvbxcvb' },
                         { user_id: 2,post_id:3, text: 'dfgsetygtthrth' },
                         { user_id: 3,post_id:1, text: 'sdfgsdfgsdfgsdfgsdfg' }, ])                        

   Like.create([{ user_id: 1, post_id:1,  },
                         { user_id: 1,post_id:2 },
                         { user_id: 2,post_id:1},
                         { user_id: 2,post_id:2 },
                         { user_id: 2,post_id:3 },
                         { user_id: 3,post_id:1 }, ])                          