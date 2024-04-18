FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname                     { Faker::Name.name }
    email                        { Faker::Internet.email }
    password                     { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation        { password }
    family_name                  { person.last.kanji }
    first_name                   { person.first.kanji }
    family_name_kana             { person.last.katakana }
    first_name_kana              { person.first.katakana }
    birth_day                    { Faker::Date.backward }
  end
end
