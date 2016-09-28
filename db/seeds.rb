User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
              email: email,
              password:              password,
              password_confirmation: password,
              activated: true,
              activated_at: Time.zone.now)
end

Micropost.find_or_create_by( content: 'アイウエオ', image: '/20160612/test.img', delete_flg: 0, title: 'test')
Person.find_or_create_by(image:'my.jpg',first_name:'テスト',last_name:'名前',birth_date:'2000/12/12',dead:0,gender:1,birth_place:'sendai',city:'sendai',cuntry:'japan',summary:'俺おれ',occupation:'se',delete_flg:0)
