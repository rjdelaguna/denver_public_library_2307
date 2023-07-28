require 'spec_helper'

RSpec.describe Book do
  before(:each) do
    @book = Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})
  end

  describe "#initialize" do
    it 'creates a new instance of book' do
      
      expect(@book).to be_a Book
    end
    
    it 'has readable attributes' do

      expect(@book.author_first_name).to eq("Harper")
      expect(@book.author_last_name).to eq("Lee")
      expect(@book.title).to eq("To Kill a Mockingbird")
      expect(@book.publication_date).to eq("July 11, 1960")
      expect(@book.checked_out).to eq(false)
      expect(@book.check_out_count).to eq(0)
    end
  end

  describe "#author" do
    it 'returns authors full name' do
      
      expect(@book.author).to eq("Harper Lee")
    end
  end

  describe "#publication_year" do
    it 'will return just the year the book was published' do
      
      expect(@book.publication_year).to eq("1960")
    end
  end

  describe "#check_out" do
    it 'knows when it is checked out and keeps a count' do
      @book.check_out
      
      expect(@book.checked_out).to eq(true)
      expect(@book.check_out_count).to eq(1)
    end
  end
  
  describe "#return" do
    it 'makes the book no longer checked out' do
      @book.check_out
      expect(@book.checked_out).to eq(true)
      @book.return
      expect(@book.checked_out).to eq(false)
    end
  end
end