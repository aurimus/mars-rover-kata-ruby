require File.join(File.dirname(__FILE__), 'mars_rover')

describe Rover do
  it 'should start at position 0,0 if no position is given' do
    rover = Rover.new
    expect(rover.position).to eq([0,0])
  end

  it 'should start at given position' do
    rover = Rover.new(position: [2,2])
    expect(rover.position).to eq([2,2])
  end

  it 'should start at direction N if no direction is given' do
    rover = Rover.new
    expect(rover.direction).to eq('N')
  end

  it 'should start at given direction' do
    rover = Rover.new(direction: 'W')
    expect(rover.direction).to eq('W')
  end

  it 'should move north if direction is N and move type is forward' do
    rover = Rover.new(direction: 'N', position: [2,2])
    rover.make_move(type: 'f')
    expect(rover.position).to eq([2,3])
  end

  it 'should move south if direction is N and move type is backwards' do
    rover = Rover.new(direction: 'N', position: [2,2])
    rover.make_move(type: 'b')
    expect(rover.position).to eq([2,1])
  end

  it 'should move east if direction is E and move type is forward' do
    rover = Rover.new(direction: 'E', position: [2,2])
    rover.make_move(type: 'f')
    expect(rover.position).to eq([3,2])
  end

  it 'should move east if direction is W and move type is backwards' do
    rover = Rover.new(direction: 'W', position: [2,2])
    rover.make_move(type: 'f')
    expect(rover.position).to eq([1,2])
  end

  it 'should make it S when direction is W and move is left' do
    rover = Rover.new(direction: 'W')
    rover.make_move(type: 'l')
    expect(rover.direction).to eq('S')
  end

  it 'should make it N when direction is W and move is right' do
    rover = Rover.new(direction: 'W')
    rover.make_move(type: 'r')
    expect(rover.direction).to eq('N')
  end

  it 'should move to pos 1 if it got out of grid size' do
    rover = Rover.new(direction: 'E', position: [9,0], grid_size: [10,10])
    rover.make_move(type: 'f')
    expect(rover.position).to eq([0,0])
  end

  it 'should move to pos 10 if it got out of grid size to negative' do
    rover = Rover.new(direction: 'W', position: [0,0], grid_size: [10,10])
    rover.make_move(type: 'f')
    expect(rover.position).to eq([9,0])
  end

end