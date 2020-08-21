require "rspec"
require "First_TDD"

describe 'uniq' do 
    it 'It returns the unique elements in the order in which they first appeared' do
        expect([1, 2, 1, 3, 3].uniq).to eq([1, 2, 3])
    end
end

describe 'my_uniq' do 
    it 'It returns the unique elements, in your own my_uniq method' do
        expect(my_uniq([1, 2, 1, 3, 3])).to eq([1, 2, 3]) #keep in mind format of how you call things
    end
end

#Array_two_sum requires Monkey Patching
#pairs have to be sorted from small index to bigger index

describe 'Array#two_sum' do
    it 'Write a new Array#two_sum method that finds all pairs of positions where the elements at those positions sum to zero.' do
        expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end
end

describe 'my_transpose' do
    it 'Write a method, my_transpose, which will convert between the row-oriented and column-oriented representations.' do 
        expect(my_transpose([[0, 1, 2], [3, 4, 5], [6, 7, 8]])).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
    end
end

describe 'stock_picker' do
    it 'takes an array of stock prices (prices on days 0, 1, ...), and outputs the most profitable pair of days' do
        stock_prices = [2, 8, 1, 10, 17, 7, 4, 15]
        expect(stock_picker(stock_prices)).to eq([2, 4])
    end
end

describe 'Hanoi' do 
    subject(:hanoi) {Hanoi.new}

    describe '#initialize' do
        it 'has a starting hanoi called tower' do 
            expect(hanoi.tower).to eq([[3, 2, 1], [], []])
        end
    end

    describe '#move' do
        context 'moves discs from one tower to another' do 
            it 'move disc at tower 0 to tower 1' do
                expect(hanoi.move(0, 1)).to eq([[3, 2], [1], []])
            end

            it 'move disc at tower 0 to tower 2' do
                expect(hanoi.move(0, 2)).to eq([[3, 2], [], [1]])
            end

            it 'move disc at tower 1 to tower 0' do
                expect{hanoi.move(1, 0)}.to raise_error(ArgumentError)
            end
        end

    end

    describe '#won?' do
        context 'hanoi tower win conditions' do
            it 'tower 3 has won' do
                hanoi.move(0, 2)
                hanoi.move(0, 1)
                hanoi.move(2, 1)
                hanoi.move(0, 2)
                hanoi.move(1, 0)
                hanoi.move(1, 2)
                hanoi.move(0, 2)
                expect(hanoi.won?).to eq(true)
            end
        end
    end
end