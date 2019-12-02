require 'test_helper'

class CheckFormat < ActionDispatch::IntegrationTest
    def setup; end

    def teardown; end

    test 'check responce with browser processing' do
        get result_path, :params => { :n => 300, :handle => 'Браузер' }
        content = '<?xml-stylesheet type="text/xsl" href="/parser.xslt"?>'
        assert response.body.include?(content)
    end

    test 'check response with server processing' do
        get result_path, :params => { :n => 300, :handle => 'Сервер' }
        content = ['<html>', '<head>', '<body>', '<table', '<th', '<tr']
        res = response.body
        assert content.all? { |str| res.include?(str) }
    end

    test 'check response without any handlings' do
        get result_path, :params => { :n => 300, :handle => 'Не обрабатывать' }
        content = ['<?xml version="1.0" encoding="UTF-8"?>', '<arrays type="array">']
        not_incl = '<?xml-stylesheet type="text/xsl" href="/parser.xslt"?>'
        res = response.body
        assert content.all? { |str| res.include?(str) } && res.exclude?(not_incl)
    end
end