require './classes/book'
require './classes/label'
require 'colorize'
require 'json'
require 'date'

class Editorial
  def initialize
    @books = []
  end
  attr_accessor :books

  def add_book
    puts 'Whats the publish year of the book?'.blue
    year = gets.chomp.to_i(10)
    puts 'Who is the publisher'.blue
    publisher = gets.chomp.capitalize
    puts 'whats is the state of the cover? [good/bad]'.blue
    cover_state = gets.chomp
    puts 'Who is the author?'.blue
    author = gets.chomp.capitalize
    puts 'What is the title?'.blue
    title = gets.chomp.capitalize
    puts 'What color should we use for a label?'.blue
    color = gets.chomp.capitalize
    label = Label.new(title, color)
    new_book = Book.new(year, publisher, cover_state, author)
    label.add_item(new_book)
    @books << new_book
    save_books
  end

  def list_books
    @books.each do |book|
      puts "Title: #{book['label_title']}
        Author: #{book['author']},
        Publish date: #{book['publish_date']},
        Cover state: #{book['cover_state']}".light_blue
    end
  end

  def list_labels
    puts 'List of all labels:'
    @books.each_with_index do |book, i|
      puts " #{i + 1}) #{book['label_title']}, Color: #{book['label_color']}"
    end
  end

  def save_books
    arr = @books.map do |book|
      if defined?(book['genre'])
        { genre: book['genre'],
          author: book['author'],
          publish_date: book['publish_date'],
          publisher: book['publisher'],
          cover_state: book['cover_state'],
          label_title: book['label_title'],
          label_color: book['label_color'] }
      else
        { genre: book.genre,
          author: book.author,
          publish_date: book.publish_date,
          publisher: book.publisher,
          cover_state: book.cover_state,
          label_title: book.label[:title],
          label_color: book.label[:color] }
      end
    end
    File.write('./data/bookCollection.json', arr.to_json)
  end

  def fetch_books
    exists = false
    exists = true if File.exist?('./data/bookCollection.json')
    unless exists
      f = File.open('./data/bookCollection.json', 'w+')
      f.write(JSON.generate([]))
      f.close
    end
    book_file = File.open('./data/bookCollection.json', 'r+')
    data = book_file.read
    @books = JSON.parse(data)
  end
end
