require 'spec_helper'

RSpec.describe Library do
  before(:each) do
    @dpl = Library.new("Denver Public Library")

    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    @harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})

    @jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")    
    @professor = @charlotte_bronte.write("The Professor", "1857")
    @villette = @charlotte_bronte.write("Villette", "1853")
    @mockingbird = @harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
  end

  describe "#initialize" do
    it 'creates a new instance of library' do

      expect(@dpl).to be_a Library
    end

    it 'has a name and collections of books and authors' do

      expect(@dpl.name).to eq("Denver Public Library")
      expect(@dpl.books).to eq([])
      expect(@dpl.authors).to eq([])
    end
  end

  describe "#add_author" do
    it 'add authors to its collection which adds the authors books as well' do
      @dpl.add_author(@charlotte_bronte)
      @dpl.add_author(@harper_lee)

      expect(@dpl.authors).to eq([@charlotte_bronte, @harper_lee])
      expect(@dpl.books).to eq([@jane_eyre, @professor, @villette, @mockingbird])
    end
  end

  describe "#publication_time_frame_for" do
    it 'can return the range of publication years for the author passed in' do
      @dpl.add_author(@charlotte_bronte)
      @dpl.add_author(@harper_lee)
      @dpl.publication_time_frame_for(@charlotte_bronte)

      expect(@dpl.publication_time_frame_for(@charlotte_bronte)).to eq ({:start => "1847", :end => "1857"})
    end
  end

  describe "#checkout" do
    it 'can check out a book' do
      @dpl.add_author(@charlotte_bronte)
      @dpl.add_author(@harper_lee)
      @dpl.checkout(@jane_eyre)
      
      expect(@jane_eyre.checked_out).to eq(true)
    end
  end
  
  describe "#checked_out_books do" do
    it 'returns an array of the books that have been checked out' do
      @dpl.add_author(@charlotte_bronte)
      @dpl.add_author(@harper_lee)
      @dpl.checkout(@jane_eyre)
      @dpl.checkout(@mockingbird)
      
      expect(@dpl.checked_out_books).to eq([@jane_eyre, @mockingbird])
    end
  end

  describe "#return" do
    it 'can return the books that have been checked out' do
      @dpl.add_author(@charlotte_bronte)
      @dpl.add_author(@harper_lee)
      @dpl.checkout(@jane_eyre)
      @dpl.checkout(@mockingbird)
      @dpl.return(@jane_eyre)
      
      expect(@jane_eyre.checked_out).to eq(false)
      expect(@dpl.checked_out_books).to eq([@mockingbird])
    end
  end

  describe "#most_popular_book" do
    it 'returns the book that has been checked out the most' do
      @dpl.add_author(@charlotte_bronte)
      @dpl.add_author(@harper_lee)
      @dpl.checkout(@jane_eyre)
      @dpl.checkout(@mockingbird)
      @dpl.return(@jane_eyre)
      @dpl.checkout(@jane_eyre)

      expect(@dpl.most_popular_book).to eq(@jane_eyre)
    end
  end
end