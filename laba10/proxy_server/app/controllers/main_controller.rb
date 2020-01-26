# frozen_string_literal: true

require 'nokogiri'
require 'net/http'

# MainController class
class MainController < ApplicationController
  XSLT_PUBLIC = "#{Rails.root}/public/parser.xslt"
  SERVER_URL = 'http://localhost:3000/main/result.xml'

  def index; end

  def result
    res = Nokogiri::XML(Net::HTTP.get(URI("#{SERVER_URL}?n=#{params[:n]}")))
    case params[:handle]
    when 'Сервер'
      render inline: XmlConverter.call(res, XSLT_PUBLIC).to_html
    when 'Браузер'
      render xml: XsltAppender.call(res, '/parser.xslt').to_xml
    when 'Не обрабатывать'
      render xml: res
    end
  end
end
