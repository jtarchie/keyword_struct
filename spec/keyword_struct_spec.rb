require 'spec_helper'

describe KeywordStruct do
  describe '.new' do
    it 'returns a new class' do
      klass = KeywordStruct.new(:name)
      expect(klass).to be_instance_of(Class)
    end

    context 'when a block is passed' do
      it 'evaluates on the returned class' do
        klass = KeywordStruct.new(:name) do
          def age
            31
          end
        end
        expect(klass.new(name: 'Bob').age).to eq 31
      end

      it 'supports super when overloading an attribute' do
        klass = KeywordStruct.new(:name) do
          def name
            super || 'N/A'
          end
        end
        instance = klass.new(name: nil)
        expect(instance.name).to eq 'N/A'
      end
    end
  end

  context 'with a new instance' do
    let(:klass) { KeywordStruct.new(:name) }

    it 'can assign values on #initialize' do
      instance = klass.new(name: 'Bob')
      expect(instance.name).to eq 'Bob'
    end

    it 'can assign values after #initialize' do
      instance = klass.new(name: 'Bob')
      instance.name = 'Bart'
      expect(instance.name).to eq 'Bart'
    end

    it 'does allow assignment of undefined arguments' do
      instance = klass.new(name: 'Bob')
      expect {
        instance.age = 31
      }.to raise_error(NoMethodError)
    end

    it 'does not allow undefined arguments' do
      expect {
        klass.new(age: 31)
      }.to raise_error(ArgumentError)
    end

    it 'requires keyword args to always be defined' do
      expect {
        klass.new
      }.to raise_error(ArgumentError)
    end
  end
end
