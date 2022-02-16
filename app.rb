Dir['./classes/*.rb'].sort.each { |file| require file}
Dir['./logic/*.rb'].sort.each { |file| require file}

class App
  def initialize
    @album_input = AlbumInput.new
  end

  def show_menu
    puts 'Select an option to create'
    puts '1.- Work with books'
    puts '2.- Work with Albums'
    puts '3.- Work with games'

    puts '4.- Exiting...'
  end
end