# Create a thesaurus application. To create it, you will create two classes, Thesaurus and Entry.
# A Thesaurus will contain many Entries. An Entry contains three primary attributes:
# word, synonymns, and antonyms. Your application should contain the following features:
# 1. The ability to add new words to a Thesaurus.
# 2. The ability to delete a word from a Thesaurus. 
# 3. The ability to look up a word's synonyms.
# 4. The ability to look up a word's antonyms.
# 5. The ability to add a synonym to a word.
# 6. The ability to add an antonym to a word.
#
# Part of the challenge is to determine which functionality belongs in the Thesaurus class,
# and which belongs in the Entry class.
#
# And... test your functionality using RSpec!

require "rspec"

class Entry
  attr_accessor :word, :synonyms, :antonyms
  def initialize(word)
    @word = word[:word]
    @synonyms = word[:synonyms]
    @antonyms = word[:antonyms]
  end
  
  def add_syn(word)
    @synonyms << word 
  end

  def add_ant(word)
    @antonyms << word 
  end
 
end  
class Thesaurus < Entry
  attr_reader :entries
  
  def initialize
    @entries = []
  end  

  def new_word(word_parameters)
    new_entry = Entry.new(word_parameters)
    @entries << new_entry
  end
  
  def delete(input)
    entries.each do |entry|
      if entry.word == input
        entry.word = nil
      end
    end   
  end
  
  
end

t1 = Thesaurus.new
t1.new_word(word: "fast", synonyms: ["speedy", "quick"], antonyms: ["slow", "sluggish"])
t1.new_word(word: "rude", synonyms: ["curt", "crass"], antonyms: ["respectful", "courteous"])
t1.new_word(word: "big", synonyms: ["huge", "giant"], antonyms: ["tiny", "small"])
p t1.entries.first.antonyms

RSpec.describe Entry do
  describe '#add_syn' do
    it 'should append another synonym to a selected word' do
      t1.entries.last.add_syn("little")
      expect(t1.entries.last.synonyms.length).to eq(3)
    end
  end
  describe '#add_ant' do
    it 'should append another antonym to a selected word' do
      t1.entries[1].add_ant("polite")
      expect(t1.entries[1].antonyms.length).to eq(3)
    end
  end
  describe '#delete' do 
    it 'should change a given word to nil' do 
      t1.delete("fast")
      expect(t1.entries[0].word).to eq(nil)
    end
  end  
end