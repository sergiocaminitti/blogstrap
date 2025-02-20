Article.delete_all

user = User.first
text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed varius aliquet condimentum. Aenean non mi velit. In vel metus id eros tempor laoreet feugiat et nibh. Maecenas mattis, risus accumsan gravida rhoncus, ipsum lorem consequat purus, ut imperdiet metus mi vitae ante. Maecenas vitae ullamcorper purus, non venenatis libero. Nulla facilisi. Morbi laoreet nisi facilisis mi euismod, vitae sagittis nisi ultricies."

p 'Inicialndo ...'

Category.all.each do |category|
  30.times do
    Article.create!(
      title: "Article #{rand(10000)}",
      body: text,
      category_id: category.id,
      user_id: user.id,
      created_at: rand(365).days.ago
    )
  end
end

p 'Terminou!'
