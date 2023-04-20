require_relative '../lib/mairie_christmas'

describe "the get_townhall_email method" do
  it "should return a mail adress based on an url" do
    expect(get_townhall_email("https://www.annuaire-des-mairies.com/95/ableiges.html")).to eq("mairie.ableiges95@wanadoo.fr")
    expect(get_townhall_email("https://www.annuaire-des-mairies.com/95/breancon.html")).to eq("mairie.breancon@wanadoo.fr")
    expect(get_townhall_email("https://www.annuaire-des-mairies.com/95/chars.html")).to eq("mairie.chars@wanadoo.fr")
  end
end

describe "the perform method" do
  it "should return response, and response is not nil" do
    expect(perform(get_townhall_urls, get_townhall_names)).not_to be_nil
  end
end

describe "the perform method" do
    it "should verify is the return is an array" do
      expect(perform(get_townhall_urls, get_townhall_names).is_a?(Array)).to be_truthy
    end
end