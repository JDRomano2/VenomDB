## NOTE: The reason why the first two blocks are commented out is because
## they were already seeded. If re-seeding a new DB, uncomment these lines

# User.create!(name:  "Example User",
#              email: "example@jdromano.net",
#              password:              "foobar",
#              password_confirmation: "foobar",
#              admin: true)

# 99.times do |n|
#   name = Faker::Name.name
#   email = "example-#{n+1}@railstutorial.org"
#   password = "password"
#   User.create!(name:  name,
#                email: email,
#                password:              password,
#                password_confirmation: password)
# end

JdrAutoparseVenom.create!(id: 1,
                          venom: "bombesin",
                          effect: "GI effects",
                          pmid: "1234567",
                          created_at: "2007-01-01 10:00:00",
                          updated_at: "2007-01-01 10:00:00")

ManualVenom.create!(id: 1,
                    venom: "bombesin",
                    effect: "GI effects",
                    pmid: "1234567",
                    created_at: "2007-01-01 10:00:00",
                    updated_at: "2007-01-01 10:00:00")

SmdbSearchVenom.create!(id: 1,
                        compound: "ziconotide",
                        predicate: "treats",
                        object: "chronic pain",
                        pmid: "1234567",
                        created_at: "2007-01-01 10:00:00",
                        updated_at: "2007-01-01 10:00:00")
