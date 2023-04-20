require_relative '../lib/dark_trader'

describe "the scraping method" do

  it "should return response, and response is not nil" do
    expect(scraping(currencies,values)).not_to be_nil
  end

  it "should verify if a specific crypto is include" do
    expect(scraping(currencies,values)).to include {"Ethereum"}
  end

  it "should verify is the return is a hash" do
      expect(scraping(currencies,values).is_a?(Array)).to be_truthy
  end
end