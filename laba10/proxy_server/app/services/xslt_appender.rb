# frozen_string_literal: true

require 'nokogiri'

# Appends xslt instruction
class XsltAppender < Service
  include Dry::Monads[:result, :do]

  def call(xml, xslt_path)
    yield append(xml, xslt_path)
  end

  private

  def append(xml_doc, ref)
    instr = Nokogiri::XML::ProcessingInstruction
            .new(xml_doc, 'xml-stylesheet', "type=\"text/xsl\" href=\"#{ref}\"")
    xml_doc.root.add_previous_sibling instr
    return Success(xml_doc) unless xml_doc.nil?

    Failure(:error_while_appending_instr)
  end
end
