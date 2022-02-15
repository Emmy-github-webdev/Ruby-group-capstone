require './classes/book.rb'

describe 'Test class Book' do
  before(:each) do
    @book = Book.new(2020,'Edgar Allan Poe', 'good')
    @book_2 = Book.new(2000,'Edgar Allan Poe', 'good')
    @book_3 = Book.new(2020,'Edgar Allan Poe', 'bad')
  end
  it 'Should be an instance of Book' do
    expect(@book).to be_instance_of Book
  end
  it 'Should NOT achievable' do
    expect(@book.can_be_archived?).to be(false)
  end
  it 'Should be achievable because of DATE' do
    expect(@book_2.can_be_archived?).to be(true)
  end
  it 'Should be achievable because of COVER' do
    expect(@book_3.can_be_archived?).to be(true)
  end
end
