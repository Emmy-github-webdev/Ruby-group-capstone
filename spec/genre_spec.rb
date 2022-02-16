require_relative '../classes/genre'

describe Genre do
  before(:each) do
    @genre = Genre.new('Ogah')
  end

  describe 'Checks the instace of genre' do
    it 'return true if the is the instaces of Genre' do
      instance_genre = Genre.new('Pauline')
      expect(instance_genre).to be_instance_of(Genre)
    end
  end

  it 'should have Items' do
    @genre.add_item(Item.new('1', '2', '3', Date.new(2020)))
    expect(@genre.items).not_to be_empty
  end
end