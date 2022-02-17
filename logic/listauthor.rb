class ListAuthor
  def self.list_all_authors(authors)
    puts 'Your authors list is empty' if authors.empty?
    authors.each_with_index do |author, index|
      puts "#{index}) Name: #{author['author']}"
    end
  end
end
