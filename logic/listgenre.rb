class ListGenre
  def self.list_all_genres(genres)
    puts 'Your genres list is empty' if genres.empty?
    genres.each_with_index do |genre, index|
      puts "#{index}) class: #{genre['class']}, Name: #{genre['name']}"
    end
  end
end
