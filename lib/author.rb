require 'spec_helper'

class Author
  attr_reader :first_name,
              :last_name,
              :books

  def initialize(details)
    @first_name = details[:first_name]
    @last_name = details[:last_name]
    @books = []
  end

  def name
    [@first_name, @last_name].join(" ")
  end

  def write(book_title, date)
    book =  Book.new({author_first_name: @first_name, author_last_name: @last_name, title: book_title, publication_date: date})
    books << book
    book
  end
end