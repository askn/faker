module Faker
  # Based on Perl"s Text::Lorem
  class Lorem
    def self.character
      characters(1)
    end

    def self.characters(char_count = 255)
      chars = ("a".."z").to_a + (0..9).to_a
      Array(String).new(char_count < 0 ? 0 : char_count, "").map { chars.sample(Faker.rng) }.join("")
    end

    def self.word
      words = Data["lorem"]["words"].as Array
      Faker.fetch(words)
    end

    def self.words(num = 3, supplemental = false)
      words = Data["lorem"]["words"].as Array(String)
      words += (Data["lorem"]["supplemental"].as Array(String)) if supplemental

      words.shuffle(Faker.rng)[0, num]
    end

    def self.sentence(word_count = 4, supplemental = false, random_words_to_add = 6)
      words(word_count + Faker.rng.rand(random_words_to_add.to_i).to_i, supplemental).join(" ").capitalize + "."
    end

    def self.sentences(sentence_count = 3, supplemental = false)
      ([] of String).tap do |sentences|
        1.upto(sentence_count) do
          sentences << sentence(3, supplemental)
        end
      end
    end

    def self.paragraph(sentence_count = 3, supplemental = false, random_sentences_to_add = 3)
      sentences(sentence_count + Faker.rng.rand(random_sentences_to_add.to_i).to_i, supplemental).join(" ")
    end

    def self.paragraphs(paragraph_count = 3, supplemental = false)
      ([] of String).tap do |paragraphs|
        1.upto(paragraph_count) do
          paragraphs << paragraph(3, supplemental)
        end
      end
    end
  end
end
