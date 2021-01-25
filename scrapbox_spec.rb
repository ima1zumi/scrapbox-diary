require 'rspec'
require_relative './scrapbox.rb'

RSpec.describe ScrapBox do
  describe '#s' do
    subject { ScrapBox.new(Date.new(2021, 1, 23)).s(format) }

    context 'フォーマットが空文字列の場合' do
      let(:format) { '' }
      it { is_expected.to eq '' }
    end

    context 'フォーマットが nil の場合' do
      let(:format) { nil }
      it { expect { subject }.to raise_error TypeError }
    end

    context 'フォーマットが hoge の場合' do
      let(:format) { 'hoge' }
      it { is_expected.to eq 'hoge' }
    end

    context 'フォーマットが %Y-%m-%d の場合' do
      let(:format) { '%Y-%m-%d' }
      it { is_expected.to eq '2021-01-23' }
    end

    context 'フォーマットが %A の場合' do
      let(:format) { '%A' }
      it { is_expected.to eq 'Saturday' }
    end
  end
end

