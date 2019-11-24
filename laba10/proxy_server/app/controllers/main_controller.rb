require 'nokogiri'
require 'open-uri'

class MainController < ApplicationController

    def index; end 

    def result
        xml_responce = Nokogiri::XML(open("#{SERVER_URL}?n=#{params[:n]}"))
        
        case params[:handle]
        when 'Сервер'
            render inline: append_xslt(xml_responce, "#{Rails.root}/public#{XSLT_PUBLIC}").to_html
        when 'Браузер'
            render xml: append_xslt_instr(xml_responce, XSLT_PUBLIC).to_xml
        when 'Не обрабатывать'
            render xml: xml_responce
        end    
    end

    protected

    def append_xslt_instr(xml_doc, xslt_href)
        instr = Nokogiri::XML::ProcessingInstruction.new(xml_doc, "xml-stylesheet", "type=\"text/xsl\" href=\"#{xslt_href}\"")
        xml_doc.root.add_previous_sibling instr
        xml_doc
    end

    def append_xslt(xml_doc, xslt_href)
        xslt = Nokogiri::XSLT(File.read(xslt_href))
        xslt.transform(xml_doc)
    end

    XSLT_PUBLIC = '/parser.xslt'
    SERVER_URL = 'http://localhost:3000/main/result.xml'
end
