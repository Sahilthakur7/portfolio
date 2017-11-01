3.times do |topic|
    Topic.create!(
        title: "Topic #{topic}"
    )
end
10.times do |blog|
    Blog.create!(
        title: "BLog no.#{blog}",
        body: "Haan haan main hu blog",
        topic_id: Topic.last.id
    )
end

5.times do |skill|
    Skill.create!(
        title: "Rails #{skill}",
        percent_utilized: 15
    )
end

9.times do |portfolio_item|
    Portfolio.create!(
        title: "Title is #{portfolio_item}",
        subtitle: "Ruby on Rails",
        body: "Tere mast mast do nain",
        main_image: "http://placehold.it/600x400",
        thumb_image: "http://placehold.it/300x200"

    )
end

1.times do |portfolio_item|
    Portfolio.create!(
        title: "Title is #{portfolio_item}",
        subtitle: "ReactJS",
        body: "Tere mast mast do nain",
        main_image: "http://placehold.it/600x400",
        thumb_image: "http://placehold.it/300x200"

    )
end
