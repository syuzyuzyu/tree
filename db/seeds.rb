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

post1 = Micropost.create( content: 'アイウエオ', image: '/20160612/test.img', delete_flg: 0, title: 'test')
post2 = Micropost.create( content: 'アイウエオ', image: '/20160612/test.img', delete_flg: 0, title: 'test')
post3 = Micropost.create( content: 'アイウエオ', image: '/20160612/test.img', delete_flg: 0, title: 'test')
post4 = Micropost.create( content: 'アイウエオ', image: '/20160612/test.img', delete_flg: 0, title: 'test')
post5 = Micropost.create( content: 'アイウエオ', image: '/20160612/test.img', delete_flg: 0, title: 'test')
post6 = Micropost.create( content: 'アイウエオ', image: '/20160612/test.img', delete_flg: 0, title: 'test')
post7 = Micropost.create( content: 'アイウエオ', image: '/20160612/test.img', delete_flg: 0, title: 'test')
post8 = Micropost.create( content: 'アイウエオ', image: '/20160612/test.img', delete_flg: 0, title: 'test')

pserson1 = Person.create(image:'my.jpg',first_name:'テスト1',last_name:'名前',birth_date:'2000/12/12',dead:0,gender:1,birth_place:'sendai',city:'sendai',cuntry:'japan',summary:'俺おれ',occupation:'se',delete_flg:0)
pserson2 = Person.create(image:'my.jpg',first_name:'テスト2',last_name:'名前',birth_date:'2000/12/12',dead:0,gender:1,birth_place:'sendai',city:'sendai',cuntry:'japan',summary:'俺おれ',occupation:'se',delete_flg:0)
pserson3 = Person.create(image:'my.jpg',first_name:'テスト3',last_name:'名前',birth_date:'2000/12/12',dead:0,gender:1,birth_place:'sendai',city:'sendai',cuntry:'japan',summary:'俺おれ',occupation:'se',delete_flg:0)
pserson4 = Person.create(image:'my.jpg',first_name:'テスト4',last_name:'名前',birth_date:'2000/12/12',dead:0,gender:2,birth_place:'sendai',city:'sendai',cuntry:'japan',summary:'俺おれ',occupation:'se',delete_flg:0)
pserson5 = Person.create(image:'my.jpg',first_name:'テスト5',last_name:'名前',birth_date:'2000/12/12',dead:0,gender:2,birth_place:'sendai',city:'sendai',cuntry:'japan',summary:'俺おれ',occupation:'se',delete_flg:0)
pserson6 = Person.create(image:'my.jpg',first_name:'テスト6',last_name:'名前',birth_date:'2000/12/12',dead:0,gender:2,birth_place:'sendai',city:'sendai',cuntry:'japan',summary:'俺おれ',occupation:'se',delete_flg:0)
pserson7 = Person.create(image:'my.jpg',first_name:'テスト7',last_name:'名前',birth_date:'2000/12/12',dead:0,gender:1,birth_place:'sendai',city:'sendai',cuntry:'japan',summary:'俺おれ',occupation:'se',delete_flg:0)
pserson8 = Person.create(image:'my.jpg',first_name:'テスト8',last_name:'名前',birth_date:'2000/12/12',dead:0,gender:1,birth_place:'sendai',city:'sendai',cuntry:'japan',summary:'俺おれ',occupation:'se',delete_flg:0)
pserson9 = Person.create(image:'my.jpg',first_name:'テスト9',last_name:'名前',birth_date:'2000/12/12',dead:0,gender:1,birth_place:'sendai',city:'sendai',cuntry:'japan',summary:'俺おれ',occupation:'se',delete_flg:0)
pserson10 = Person.create(image:'my.jpg',first_name:'テスト10',last_name:'名前',birth_date:'2000/12/12',dead:0,gender:1,birth_place:'sendai',city:'sendai',cuntry:'japan',summary:'俺おれ',occupation:'se',delete_flg:0)
pserson11 = Person.create(image:'my.jpg',first_name:'テスト11',last_name:'名前',birth_date:'2000/12/12',dead:0,gender:2,birth_place:'sendai',city:'sendai',cuntry:'japan',summary:'俺おれ',occupation:'se',delete_flg:0)


pserson1.experiences.find_or_create_by(micropost_id: post1.id)
pserson2.experiences.find_or_create_by(micropost_id: post2.id)
pserson3.experiences.find_or_create_by(micropost_id: post3.id)
pserson4.experiences.find_or_create_by(micropost_id: post4.id)
pserson5.experiences.find_or_create_by(micropost_id: post5.id)
pserson6.experiences.find_or_create_by(micropost_id: post6.id)
pserson7.experiences.find_or_create_by(micropost_id: post7.id)
pserson8.experiences.find_or_create_by(micropost_id: post8.id)
pserson9.experiences.find_or_create_by(micropost_id: post1.id)
pserson10.experiences.find_or_create_by(micropost_id: post1.id)
pserson11.experiences.find_or_create_by(micropost_id: post1.id)

#以下エラー
pserson1.marriages.find_or_create_by(spouse_id: pserson5.id)
pserson5.marriages.find_or_create_by(spouse_id: pserson1.id)

pserson1.parents.find_or_create_by(connection_id: pserson10.id)
pserson1.parents.find_or_create_by(connection_id: pserson11.id)

pserson1.children.find_or_create_by(connection_id: pserson3.id)