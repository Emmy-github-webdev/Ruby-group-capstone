Dir['./classes/*.rb'].sort.each { |file| require file }
Dir['./logic/*.rb'].sort.each { |file| require file }

class App
  def initialize
    @album_input = AlbumInput.new
    @book_logic = BookLogic.new
    @game_input = GameInput.new
  end

  def run
    show_menu
    selection = gets.chomp
    case selection
    when '1'
      @book_logic.start
    when '2'
      @album_input.start
    when '3'
      @game_input.start
    else
      puts 'Thank you!'
      nil
    end
  end

  def show_menu
    puts 'Select an option to create'
    puts '1.- Work with books'
    puts '2.- Work with Albums'
    puts '3.- Work with games'
    puts '4.- Exiting'
  end
end
