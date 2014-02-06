class ServiceController < ApplicationController
  
  def xml_return name, short_name
    require "rexml/document"
    doc = REXML::Document.new "<?xml version='1.0'?><#{name}><nombre>#{short_name}</nombre><disponibilidad>#{rand(2)}</disponibilidad></#{name}>"
    xml = ""
    doc.write xml, 1
    xml
  end

  def output response
    respond_to do |format|
      format.json { render json: Hash.from_xml(response.gsub(/\n+/, "").gsub(/\s+/, "")).to_json, :content_type => 'application/json' }
      format.xml { render xml: response, :content_type => 'text/xml' }
      format.yaml { render :text => Hash.from_xml(response.gsub(/\n+/, "").gsub(/\s+/, "")).to_yaml, :content_type => 'text/yaml'}
    end
  end

  def server
    output xml_return "servidor", "S1"
  end

  def link
    output xml_return "enlace", "E1"
  end

  def router
    output xml_return "router", "R1"
  end
end
