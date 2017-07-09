require "./spec_helper"

describe Faker::Lorem do
  it "should return deterministic results when seeded" do
    Faker.seed 123456
    Faker::Lorem.word.should eq "voluptatem"
    Faker::Lorem.words.should eq ["quos", "recusandae", "sed"]
    Faker::Lorem.words(4).should eq ["iusto", "quia", "placeat", "quia"]
    Faker::Lorem.words(4, true).should eq ["vis", "ambulo", "vesica", "vivo"]
    Faker::Lorem.characters.should eq "xk7jz4c7a0w5ceh9opz68kq3xzdt5d2rtu29ky6jlb1ltxk3xvqkp87o2c7bs070wggzuz78an6t4cg8fejvhskgfe6ry104yc7kam8p91oaf6bqb61tp84q4958om8glep3wjrl9no32fj1eoklww8bzhvzmdkyp1tn51zxpzm8eynd7mbix1rimwrpufnut2a58d76mwrn4epjao7pedef2roosl2simxsvi4lejwzrdojegew2csobpw2lym"
    Faker::Lorem.characters(10).should eq "vp5j8u3r1l"
    Faker::Lorem.sentence.should eq "Itaque quod aliquam veritatis nemo dolorum sequi."
    Faker::Lorem.sentence(3).should eq "Accusantium dolores suscipit praesentium."
    Faker::Lorem.sentence(3, true).should eq "Spiculum triumphus necessitatibus appono angulus aut cariosus."
    Faker::Lorem.sentence(3, false, 4).should eq "Atque sed perferendis minus."
    Faker::Lorem.sentence(3, true, 4).should eq "Cohors traho tamdiu alveus itaque."
    Faker::Lorem.sentences.should eq ["Sed ab quia.",
                                      "Consequatur doloremque dolores ratione voluptas esse aut vero.",
                                      "Qui dicta est odit nihil exercitationem nesciunt."]
    Faker::Lorem.sentences(1).should eq ["Reiciendis doloremque vero sequi et quia."]
    Faker::Lorem.sentences(1, true).should eq ["Concido quisquam cerno vulpes maxime mollitia."]
    Faker::Lorem.paragraph.should eq "Maxime magnam vel velit id. Sed cupiditate blanditiis. Cupiditate sit aliquam vero."
    Faker::Lorem.paragraph(2).should eq "Nemo laboriosam quod accusamus ab modi excepturi. Eveniet rerum quasi quia culpa. Vero quis aut. A assumenda tenetur."
    Faker::Lorem.paragraph(2, true).should eq "Pecunia sopor ars vero subiungo quis urbanus. Demens minus delinquo."
    Faker::Lorem.paragraph(2, false, 4).should eq "Mollitia delectus qui et ut quasi. Eligendi aut facilis praesentium ducimus qui. Itaque molestiae laudantium qui omnis veritatis soluta. Quia reiciendis dignissimos saepe architecto. Eum excepturi dolores iusto quisquam."
    Faker::Lorem.paragraph(2, true, 4).should eq "Depraedor vitae spectaculum cupio acervus conatus adipisci. Pecus vulgivagus terra aliqua arbitro. Suscipio socius cupiditas arguo cetera colloco trans solitudo. Adimpleo stillicidium eaque ocer placeat adstringo ustulo balbus. Versus viduo videlicet tenus absconditus."
    Faker::Lorem.paragraphs.should eq ["Rerum odit ducimus ipsum at sint. Consequatur sed non dolorem. Incidunt quae libero. Enim quam molestiae necessitatibus.",
                                       "Inventore eos dolores asperiores corrupti cupiditate. Illum at molestiae cumque eaque aut. Blanditiis et laudantium neque. Consequatur labore officiis pariatur possimus facilis.",
                                       "Esse fuga cum quisquam tenetur impedit rem repellat. Quia deleniti nulla. Excepturi perferendis dolor accusamus."]
    Faker::Lorem.paragraphs(1).should eq ["Rerum unde voluptas sint autem. Fugit tenetur sequi totam esse. Explicabo omnis consequatur inventore autem. Et et praesentium neque quo natus."]
    Faker::Lorem.paragraphs(1, true).should eq ["Conitor reiciendis minima viridis temporibus spiritus. Tabula crustulum error titulus et comptus. Coruscus turpis amplitudo combibo alias deludo triginta."]
  end
end
