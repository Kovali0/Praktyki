require 'rails_helper'

RSpec.describe Author, type: :model do
    describe 'validations' do
        it { should validate_presence_of(:name) }
        it { should validate_presence_of(:surname) }
        #it 'should require name and surname presence' do
         #   expect(Author.new).not_to be_valid
          #  expect(Author.new(name: 'test')).not_to be_valid
           # expect(Author.new(name: 'test', surname: 'test')).to be_valid
        #end
    end

    describe 'attributes' do
        it 'should have proper attributes' do
            expect(subject.attributes).to include('name', 'surname' ,'age') 
        end
    end

    describe 'scpe' do
        let(:author1) {Author.create(name: 'test', surname: 'test', age: 15)}
        let(:author2) {Author.create(name: 'test', surname: 'test', age: 45)}
        it 'should have old scope' do
            expect(Author.old).to include(author2)
            expect(Author.old).not_to include(author1)
        end
        it 'should have young scope' do
            expect(Author.young).to include(author1)
            expect(Author.young).not_to include(author2)
        end
    end

    describe 'callbacks' do
        let!(:author) {create(:author, age: nil)}
        it 'should set age to 25' do
            expect(author.reload.age).to eq(25)
        end
    end

    describe 'relations' do
        it { should have_many(:posts) }
    end

    describe '#fullname' do
        let!(:author) {create(:author)}
        it 'should have working #fullname method' do
            expect(author.fullname).to eq("#{author.name} #{author.surname}")
        end
    end
end