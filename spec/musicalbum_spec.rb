require 'rspec'
require_relative '../classes/musicalbum'

describe MusicAlbum do
  before(:each) do
    @musicalbum = MusicAlbum.new('2020', 'Emmanuel', 'true', 'Drama')
  end
  context 'Testing music album class' do
    describe 'Check the properties of MusicAlbum class' do
      it 'Returns the properties of Music Album without error' do
        expect(@musicalbum).to be_instance_of(MusicAlbum)
      end

      it 'It can be archived?' do
        expect(@musicalbum.archived).to be false
      end
    end
  end
end
