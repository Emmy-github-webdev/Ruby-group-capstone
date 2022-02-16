class ListAlbum
  def self.list_album(albums)
    puts 'Your library is empty' if albums.empty?
    albums.each do |album|
      puts "Id: #{album['id']}),
            class: #{album['class']},
            On Spotify: #{album['on_spotify']},
            Genre: #{album['genre']['name']}}"
    end
  end
end
