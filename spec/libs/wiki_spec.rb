require 'spec_helper'

describe 'wiki' do
  
  before(:each) do
    @parser = Holarse::Wiki::Parser.new
    @parsetypes = :plain
  end

  it "should print out plain" do
    txt = "hallo welt."

    result = @parser.format_to_html(txt, @parsetypes)

    expect(result).to eq(txt)
  end

  it "should parse web links" do
    txt = "this is a link to [http://www.google.de Google]. Click it!"
    expected = "this is a link to <a href=\"http://www.google.de\">Google</a>. Click it!"

    result = @parser.format_to_html(txt, :external_links)
    expect(result).to eq(expected)
  end

  it "should parse article links" do
    txt = "look it up in the article of [[Machinarium]] on this site."
    expected = "look it up in the article of <a href=\"/articles/machinarium\">Machinarium</a> on this site."

    result = @parser.format_to_html(txt, :article_links)
    expect(result).to eq(expected)
  end

  it "should parse web and article links together" do
    txt = "look [[Machinarium]] up here on holarse or go to [http://www.google.de Google] and look for yourself."
    expected = "look <a href=\"/articles/machinarium\">Machinarium</a> up here on holarse or go to <a href=\"http://www.google.de\">Google</a> and look for yourself."

    result = @parser.format_to_html(txt, :article_links, :external_links)
    expect(result).to eq(expected)
  end

  it "should parse multiple article links" do
    txt = "this is [[Braid]] and this is [[Machinarium]] and this is [[Sword Soldiers: The Return]], which are all good games."
    expected = "this is <a href=\"/articles/braid\">Braid</a> and this is <a href=\"/articles/machinarium\">Machinarium</a> and this is <a href=\"/articles/sword_soldiers_return\">Sword Soldiers: The Return</a>, which are all good games."

    result = @parser.format_to_html(txt, :article_links)
    expect(result).to eq(expected)
  end
end
