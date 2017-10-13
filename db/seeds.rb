10.times do |blog|
    Blog.create!(
        title: "BLog no.#{blog}",
        body: "Haan haan main hu blog"
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
        subtitle: "dekho 2000 zmana aa gya",
        body: "Tere mast mast do nain",
        main_image: "http://placehold.it/600x400",
        thumb_image: "http://placehold.it/300x200"

    )
end
