require 'rails_helper'

RSpec.describe Post, type: :model do
    let!(:author) {Author.create(name: 'test', surname: 'example', age: 34)}
    describe 'validations' do
        it { should validate_presence_of(:title) }
        it { should validate_presence_of(:content) }
        it { should validate_presence_of(:author_id) }
        #it 'should require name and surname presence' do
         #   expect(Author.new).not_to be_valid
          #  expect(Author.new(name: 'test')).not_to be_valid
           # expect(Author.new(name: 'test', surname: 'test')).to be_valid
        #end
    end

    describe 'attributes' do
        it 'should have proper attributes' do
            expect(subject.attributes).to include('title', 'content', 'created_at', 'updated_at', 'author_id') 
        end
    end

    describe 'scope' do
        it 'should have old scope' do
            post1 = Post.create(title: 'test', content: 'test wspanialego kontentu testowego postu', author_id: author.id)
            post2 = Post.create(title: 'test', content: 'test wspanialego kontentu testowego postu', author_id: author.id)
            post1.update(created_at: 50.minutes.ago)
            expect(Post.old).to include(post1)
            expect(Post.old).not_to include(post2)
        end
    end

    describe 'relations' do
        it { should belong_to(:author) }
    end

    describe '#fullpost' do
        it 'should have working #fullost method' do
            post = Post.new(title: 'test', author_id: author.id, content: 'test wspanialego kontentu testowego postu')
            expect(post.fullpost).to eq('test Author nr: 1 test wspanialego kontentu testowego postu')
        end
    end
end