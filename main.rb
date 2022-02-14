class Main
  def run
    show_menu
  end

  def show_menu
    p 'Select one option'
    p '1.- Work with Books'
    p '2.- Work with Music Albums'
    p '3.- Work with Games'
  end
end

main = Main.new
main.run
