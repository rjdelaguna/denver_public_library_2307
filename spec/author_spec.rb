require 'spec_helper'

RSpec.describe Author do
  before(:each) do
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
  end

  describe "#initialize" do
    it 'creates a new instance of author' do

      expect(@charlotte_bronte).to be_a Author
    end

    it 'has readable attributes' do
      
      expect(@charlotte_bronte.first_name).to eq("Charlotte")
      expect(@charlotte_bronte.last_name).to eq("Bronte")
    end

    it 'has a name and collection of books they have written' do

      expect(@charlotte_bronte.name).to eq("Charlotte Bronte")
      expect(@charlotte_bronte.books).to eq([])
    end
  end

  describe "#write" do
    it 'can make a new instance of book' do
      jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      
      expect(jane_eyre.class).to eq(Book)
      expect(jane_eyre.title).to eq("Jane Eyre")
    end
    
    it 'adds the new book to the authors collection' do
      jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      villette = @charlotte_bronte.write("Villette", "1853")
      
      expect(@charlotte_bronte.books).to eq([jane_eyre, villette])
    end
  end
end