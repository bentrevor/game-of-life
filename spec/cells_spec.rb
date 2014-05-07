require 'cells'

describe Cells do
  let(:cells) { Cells.new [0, 1, 0,
                           1, 0, 1,
                           0, 1, 0] }

  it 'can be dead or alive' do
    cells[0].should be 0
    cells[1].should be 1
  end

  it 'can kill a cell' do
    cells.kill 1
    cells[1].should be 0
  end

  it 'can give birth a cell' do
    cells.give_birth 0
    cells[0].should be 1
  end

  it 'counts living neighbors' do
    cells.living_neighbors_of(0).should == 2
    cells.living_neighbors_of(1).should == 2
    cells.living_neighbors_of(2).should == 2
    cells.living_neighbors_of(4).should == 4
  end
end
