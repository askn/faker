require "./spec_helper"

describe Faker::Lorem do
  it "should return deterministic results when seeded" do
    Faker.seed 123456
    Faker::Lorem.word.should eq "consequatur"
    Faker::Lorem.words.should eq ["porro", "eos", "velit"]
    Faker::Lorem.words(4).should eq ["illo", "omnis", "quam", "quia"]
    Faker::Lorem.words(4, true).should eq ["abstergo", "volo", "congregatio", "cenaculum"]
    Faker::Lorem.characters.should eq "rtu4oasce8rh8v9boy4o7dvw9da4ehtukyicl07az92gxkatlehuga41fqg8v06po1txnjcylbivmv5z9rcgg0hizegu4lck3rnja8kvpwiwp4lds3au07h9lk3k3y7a1c5ec2jtlo5zjtcm3blh6zgtk9rq8wpkqszhv0tstyydx8974aik0j2nkck9ve4kjmh0gn9als5wwxjwtot2yegk8jwe8plvbffu86w38abdq4cupnu4tig75lmu82g"
    Faker::Lorem.characters(10).should eq "qunro8qzs5"
    Faker::Lorem.sentence.should eq "Dicta laudantium aut aut et asperiores quidem accusamus impedit."
    Faker::Lorem.sentence(3).should eq "Quam eum fugit."
    Faker::Lorem.sentence(3, true).should eq "Caelum arma illum depopulo cupressus quaerat suus."
    Faker::Lorem.sentence(3, false, 4).should eq "Est non necessitatibus."
    Faker::Lorem.sentence(3, true, 4).should eq "Accedo venustas summisse cito sperno."
    Faker::Lorem.sentences.should eq ["Voluptatem similique quia architecto quo.", "Culpa fugiat pariatur facilis ea accusantium voluptatem consequatur.", "Similique quis velit excepturi quia."]
    Faker::Lorem.sentences(1).should eq ["Tempore repellat omnis."]
    Faker::Lorem.sentences(1, true).should eq ["Aedificium adhuc patruus capio valens molestiae sit."]
    Faker::Lorem.paragraph.should eq "Fugit repellendus suscipit dolores. Voluptatem adipisci nihil cupiditate quisquam ad. Est repellat consequuntur laboriosam reiciendis est sit. Vel molestiae ipsam."
    Faker::Lorem.paragraph(2).should eq "Non consectetur itaque aut voluptas cumque est numquam. Non impedit quaerat iusto consequatur tempora nemo amet."
    Faker::Lorem.paragraph(2, true).should eq "Pecus urbs curo vinitor volubilis. Coadunatio tunc quas compono. Vetus ascit adfectus civis minus tristis adulatio solio."
    Faker::Lorem.paragraph(2, false, 4).should eq "Minima ducimus officia reprehenderit dolorem. Labore quia ut asperiores eos excepturi. Quibusdam tempore incidunt sunt quaerat provident."
    Faker::Lorem.paragraph(2, true, 4).should eq "Tego vinco ultio celebrer eveniet cupio argentum speculum. Candidus arbor quibusdam angulus termes. Strenuus concido vulnero. Desino assentator deludo stabilis vallum autem demergo. Temeritas tristis nihil aperio acerbitas."
    Faker::Lorem.paragraphs.should eq ["Voluptatem id dolor tempora. Praesentium harum dolores et explicabo unde ut. Sit deleniti vel ullam enim neque non itaque. Rerum qui quam quis et voluptate. Modi tenetur eius molestiae.", "Eaque pariatur quasi optio aliquam nihil quibusdam inventore. Voluptas eaque est nesciunt tenetur vel. Accusamus et et.", "Distinctio cum deserunt quia natus eos debitis neque. Qui voluptates quisquam. Facilis voluptatem et. Nihil nostrum occaecati at."]
    Faker::Lorem.paragraphs(1).should eq ["Libero voluptatem neque et autem aspernatur earum animi. Ut iure sed quo quasi dolores aut. Voluptas possimus voluptatem nisi."]
    Faker::Lorem.paragraphs(1, true).should eq ["Cibo cognatus temporibus demulceo cinis. Voluptatibus vobis ver cursus aperiam sulum apostolus. Id animadverto caste. Summisse derideo vallum. Suspendo et denuo collum accendo tamisium verecundia iste."]
  end
end
