require './classes/label'

describe 'Test class LABEL' do
  before(:each) do
    @label = Label.new('12 Rules for Life', 'red')
  end
  it 'Should be an instance of label' do
    expect(@label).to be_instance_of Label
  end
  it 'Should be red' do
    expect(@label.color).to eq('Red')
  end
  it 'Should be 12 Rules For Life' do
    expect(@label.title).to eq('12 rules for life')
  end
end
