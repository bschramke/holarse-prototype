# encoding: UTF-8
require 'spec_helper'

describe 'wiki' do
  
  before(:each) do
    @parser = Holarse::Wiki::Parser.new
    @parsetypes = :plain
  end

  it "should print out preview" do
    txt = "hallo welt. Mit einem [[Link]] auf [http://www.google.de Google]. Da steht die Welt Kope!!! Da kannste, nix machen?"
    result = @parser.format_to_html(txt, :preview)
    expected = "hallo welt. Mit einem Link auf http://www.google.de Google. Da steht die Welt Kope!!! Da kannste, nix machen?"
    expect(result).to eq(expected)
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
    expected = "this is <a href=\"/articles/braid\">Braid</a> and this is <a href=\"/articles/machinarium\">Machinarium</a> and this is <a href=\"/articles/sword-soldiers-the-return\">Sword Soldiers: The Return</a>, which are all good games."

    result = @parser.format_to_html(txt, :article_links)
    expect(result).to eq(expected)
  end

  it "should parse this correctly" do
    txt = "Der Indie-Space-Invader-Clone [[Voxeliens]] erhält eine Portierung auf Linux. Das Spiel selbst ist DRM-frei und der Kauf enthält die Windows und Linuxversion, sobald das Spiel auch auf Linux fertig portiert wurde. Das Spiel ist für $3,99 erhältlich. Den Fortschritt der Linuxportierung ist im firmeneigenen [http://www.volumesoffun.com/blog/ Blog] nachzulesen ([http://www.volumesoffun.com/voxeliens-linux-port-progress-report/ Blog-Eintrag zum Stand der Portierung])."
    expected = "Der Indie-Space-Invader-Clone <a href=\"/articles/voxeliens\">Voxeliens</a> erhält eine Portierung auf Linux. Das Spiel selbst ist DRM-frei und der Kauf enthält die Windows und Linuxversion, sobald das Spiel auch auf Linux fertig portiert wurde. Das Spiel ist für $3,99 erhältlich. Den Fortschritt der Linuxportierung ist im firmeneigenen <a href=\"http://www.volumesoffun.com/blog/\">Blog</a> nachzulesen (<a href=\"http://www.volumesoffun.com/voxeliens-linux-port-progress-report/\">Blog-Eintrag zum Stand der Portierung</a>)."

    result = @parser.format_to_html(txt, :article_links, :external_links)
    expect(result).to eq(expected)
  end
end