require 'rspec'
require_relative '../classes/musicalbum'
require_relative '../classes/genre'

describe MusicAlbum do
  before :each do
    @musicalbum = MusicAlbum.new('02/02/2020', 'Emmanuel Ogah', 'True', 'Drama')
  end

  describe 'Check the properties of MusicAlbum class' do
    it 'Returns the properties of Music Album without error' do
      expect(@musicalbum).to be_instance_of(MusicAlbum)
    end
  end
  
end
