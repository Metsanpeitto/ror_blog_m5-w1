names = ['Juan', 'Pekka', 'Luula', 'Aarnio', 'Aarto']
5.times do |i|
	user = User.create(name: names[i],email:"user#{i}@asd.com", photo: "https://randomuser.me/api/portraits/men/#{i}.jpg", bio: 'Lots of things to say in here', role: 'default',
   post_counter: 1,password: '123456', password_confirmation: '123456')
	3.times do |j|
		post = Post.create(user_id: user.id, title: 'The post1', text: 'This post tells lot of stuff in the form of, of course, a post.')
		5.times do |k|
			Comment.create(user_id: user.id, post_id: post.id, text: 'This comment belongs to the post above.')
		end
		post.likes.create( user_id: user.id, post_id: post.id, )
	end
end