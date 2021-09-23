# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Year, "モデルに関するテスト", type: :model do
  describe '保存してみる' do
    it "有効な投稿内容の場合は保存されるか" do
      expect(FactoryBot.build(:year)).to be_valid
    end
  end
  context "空白のバリデーションチェック" do
    it "titleが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってくるか" do
      year = Year.new(title: '')
      expect(year).to be_invalid
      expect(year.errors[:title]).to include("を入力してください")
    end
  end
end