require 'mayhem'
require 'spec_helper'

describe Mayhem, '#synonymize' do
  subject { Mayhem.synonymize(input) }
  before { Mayhem.stub(:data_directory).and_return(SpecHelper.test_data_directory) }

  context 'when passed text' do
    let(:input) { 'A boy has never wept... nor dashed a thousand kin.' }

    it 'replaces known words with synonyms' do
      expect(subject).to eq 'A ragamuffin has nevermore wept... nor undone a zillion kin.'
    end
  end

  context 'when passed an empty string' do
    let(:input) { '' }

    it 'returns an empty string' do
      expect(subject).to eq ''
    end
  end

  context 'when passed non-strings' do
    it 'returns synonymized versions of their respective string representations' do
      expect(Mayhem.synonymize(nil)).to eq ''
      expect(Mayhem.synonymize(1234)).to eq '1234'
      expect(Mayhem.synonymize([1, 2, 3, 4])).to eq '[1, 2, 3, 4]'
    end
  end
end
