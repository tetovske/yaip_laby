# frozen_string_literal: true

require 'nokogiri'

# Class for handling responses
class XmlConverter < Service
  include Dry::Monads[:result, :do]

  def call(xml, href)
    yield convert(xml, href)
  end

  private

  def convert(xml_doc, xslt_href)
    xslt = Nokogiri::XSLT(File.read(xslt_href))
    result = xslt.transform(xml_doc)
    return Success(result) unless result.nil?

    Failure(:error_while_converting)
  end
end
