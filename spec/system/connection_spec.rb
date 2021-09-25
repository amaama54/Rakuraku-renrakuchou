# frozen_string_literal: true

require 'rails_helper'

describe '投稿のテスト' do
  let!(:connection) { create(:connection, title:'hoge', body:'hoge') }
  describe 'トップ画面のテスト' do
    before do
      visit root_path
    end
    context '表示の確認' do
      it 'トップ画面に「小さなことから連絡を」が表示されているか' do
        expect(page).to have_context '小さなことから連絡を'
      end
    end
  end

  describe '投稿画面のテスト' do
    before do
      visit teacher_connections_path
    end
    context '表示の確認' do
      it 'teacher_connections_pathが"/teacher/connections"であるか' do
        expect(page).to eq('/teacher/connections')
      end
      it '投稿ボタンが表示されているか' do
        expect(page).to have_button '投稿'
      end
    end
    context '投稿処理のテスト' do
      it '投稿後のリダイレクト先は正しいか' do
        fill_in 'connection[title]', with: Facker::Lorem.characters(number:5)
        fill_in 'connection[body]', with: Facker::Lorem.characters(number:20)
        click_button '投稿'
        expect(page).to have_current_path teacher_connections_path(Connection.last)
      end
    end
    context '表示の確認' do
      it '投稿されたものが表示されているか' do
        expect(page).to have_content connection.title
        expect(page).to have_link connection.title
      end
    end
  end
  
  describe '詳細画面のテスト' do
    before do
      visit teacher_connection_path(connection)
    end
    context '表示の確認' do
      it '削除リンクが存在しているか' do
        expect(page).to have_link '削除'
      end
      it '編集リンクが存在しているか' do
        expect(page).to have_link '編集'
      end
    end
    context 'リンクの遷移先の確認' do
      it '編集の遷移先は編集画面か' do
        edit_link = find_all('a')[3]
        edit_link.click
        expect(current_path).to eq('/teacher/connection/' + connection.id.to_s + '/edit')
      end
    end
    context 'connection削除のテスト' do
      it 'connectionの削除' do
        expect{ connection.destroy }.to change{ Connection.count }.by(-1)
      end
    end
  end
  
  describe '編集画面のテスト' do
    before do
      visit edit_teacher_connection_path(connection)
    end
    context '表示の確認' do
      it '編集前のタイトルと本文がフォームに表示されている' do
        expect(page).to have_field 'connection[title]', with: connection.title
        expect(page).to have_field 'connection[body]', with: connection.body
      end
    end
    context '更新処理に関するテスト' do
      it '更新後のリダイレクト先は正しいか' do
        fill_in 'connection[title]', with: Faker::Lorem.characters(number:5)
        fill_in 'connection[body]', with: Faker::Lorem.characters(number:20)
        click_button '保存'
        expect(page).to have_current_path teacher_connection_path(connection)
      end
    end
  end
end