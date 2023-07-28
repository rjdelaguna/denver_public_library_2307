class Book
  attr_reader :author_first_name,
              :author_last_name,
              :title,
              :publication_date,
              :checked_out,
              :check_out_count

  def initialize(details)
    @author_first_name = details[:author_first_name]
    @author_last_name = details[:author_last_name]
    @title = details[:title]
    @publication_date = details[:publication_date]
    @checked_out = false
    @check_out_count = 0
  end

  def author
    [@author_first_name, @author_last_name].join(" ")
  end
  
  def publication_year
    @publication_date[-4..-1]
  end

  def check_out
    if !@checked_out
      @checked_out = true
      @check_out_count += 1
    end
  end

  def return
    @checked_out = false
  end
end
