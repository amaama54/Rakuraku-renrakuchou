# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Connection, "モデルのテスト", type: :model do
  describe '保存してみる' do
    it "有効な投稿内容の場合は保存されるか" do
      expect(FactoryBot.build(:connection)).to be_valid
    end
  end
  context "空白のバリデーションチェック" do
    it "titleが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってくるか" do
      connection = Connection.new(title: '', body:'hoge')
      expect(connection).to be_invalid
      expect(connection.errors[:title]).to include("を入力してください")
    end
    it "bodyが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってくるか" do
      connection = Connection.new(title: 'hoge', body:'')
      expect(connection).to be_invalid
      expect(connection.errors[:body]).to include("を入力してください")
    end
  end
end