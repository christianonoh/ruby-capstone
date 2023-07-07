require 'rspec'
require_relative '../models/book'

RSpec.describe Book do
  describe '#can_be_archived?' do
    context 'when cover state is good' do
      it 'returns false' do
        book = Book.new(
          genre: 'Fiction',
          author: 'John Doe',
          label: 'Fantasy',
          publish_date: '2020-01-01',
          cover_state: 'good'
        )
        expect(book.can_be_archived?).to be false
      end
    end

    context 'when cover state is bad' do
      it 'returns true' do
        book = Book.new(
          genre: 'Fiction',
          author: 'Jane Smith',
          label: 'Mystery',
          publish_date: '2010-01-01',
          cover_state: 'bad'
        )
        expect(book.can_be_archived?).to be true
      end
    end
  end
end
