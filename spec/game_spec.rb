require_relative '../classes/game'
require 'date'
describe 'Game class should work without error' do
  before :each do
    @game = Game.new('Jim', 'spinner', true, 2020, 2005)
  end
  it 'instantiates a Game' do
    expect(@game).to be_instance_of(Game)
  end
  it 'can be achieved?' do
    expect(@game.archived).to be(false)
  end
end
