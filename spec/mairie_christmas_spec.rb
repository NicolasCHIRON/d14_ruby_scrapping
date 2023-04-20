require_relative '../lib/mairie_christmas'

describe "the get_townhall_email method" do
  it "should return a mail adress based on an url" do
    expect(get_townhall_email("https://www.annuaire-des-mairies.com/95/ableiges.html")).to eq("mairie.ableiges95@wanadoo.fr")
  end
end

describe "the perform method" do
  it "should return response, and response is not nil" do
    expect(perform(get_townhall_urls, get_townhall_names)).not_to be_nil
  end
end

describe "the perform method" do
    it "should verify is the return is a hash" do
      expect(perform(get_townhall_urls, get_townhall_names).is_a?(Hash)).to be_truthy
    end
end