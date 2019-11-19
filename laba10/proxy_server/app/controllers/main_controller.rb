require 'nokogiri'
require 'open-uri'

class MainController < ApplicationController

    @@xslt_public_path = '/parser.xslt'
    @@server_url = 'http://localhost:3000/main/result.xml'

    def index; end 

    def result
        xml_responce = Nokogiri::XML(open("#{@@server_url}?n=#{params[:n]}"))
        
        unless params[:serv]
            render xml: append_xslt_instr(xml_responce, @@xslt_public_path).to_xml
        else
            render inline: append_xslt(xml_responce, "#{Rails.root}/public#{@@xslt_public_path}").to_html
        end
    end

    def append_xslt_instr(xml_doc, xslt_href)
        instr = Nokogiri::XML::ProcessingInstruction.new(xml_doc, "xml-stylesheet", "type=\"text/xsl\" href=\"#{xslt_href}\"")
        xml_doc.root.add_previous_sibling instr
        xml_doc
    end

    def append_xslt(xml_doc, xslt_href)
        xslt = Nokogiri::XSLT(File.read(xslt_href))
        xslt.transform(xml_doc)
    end
end