require 'spec_helper'

class Library
  attr_reader :name,
              :authors,
              :books

  def initialize(name)
    @name = name
    @authors = []
    @books = []
  end

  def add_author(new_author)
    authors << new_author
    new_author.books.each { |book| @books << book }
  end

  def publication_time_frame_for(writer)
    if @authors.include?(writer)
      years = writer.books.map { |book| book.publication_year }
      {start: years.sort.first, end: years.sort.last}
    end
  end

  def checkout(book)
    if @books.include?(book)
      book.check_out
    end
  end

  def checked_out_books
    @books.find_all { |book| book.checked_out }
  end

  def return(book)
    if @books.include?(book)
    book.return
    end
  end

  def most_popular_book
    @books.max_by { |book| book.check_out_count }
  end
end