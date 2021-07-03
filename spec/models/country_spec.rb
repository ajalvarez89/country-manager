# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Country, type: :model do
  it { is_expected.to be_mongoid_document }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:flag) }

  describe '#save' do
    context 'with params from scratch' do
      subject(:country) do
        described_class.new(
          name: 'Colombia',
          capital: 'Bogota',
          region: 'Sur America',
          subregion: 'Latam',
          flag: 'http://flag.com'
        )
      end

      it 'is valid' do
        expect(country).to be_valid
        # is_expected.to be_valid
      end

      context 'after save' do
        before(:each) { country.save }

        it { is_expected.to be_persisted }

        it 'has a name' do
          expect(country.name).to be_present
        end
      end

      context 'without a required name' do
        subject { country.tap { |country| country.name = nil } }

        it 'is invalid' do
          expect(subject).not_to be_valid
        end
      end
    end

    context 'with params from FactoryBot' do
      subject(:country) { build(:country) }

      it 'is persisted' do
        expect(country.save).to eq true
      end
    end
  end
end
