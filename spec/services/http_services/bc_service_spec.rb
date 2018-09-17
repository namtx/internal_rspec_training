RSpec.describe HttpServices::BcService do
  let(:uri){"https://example.com"}
  subject{HttpServices::BcService.new uri}

  context "when request is unauthorized" do
    before do
      stub_request(:get, "#{uri}/v1/bpi/currentprice.json")
        .to_return(status: 401, body: JSON.generate({error: {message: :unauthorized}}))}
    end

    it "gets not authorized response" do
      expect(subject.perform!).to eq({"error" => {"message" => "unauthorized"}})
    end
  end

  context "when request is success" do
    before do
      stub_request(:get, "#{uri}/v1/bpi/currentprice.json")
        .to_return(status: 200, body: JSON.generate({chart_name: :bitcoin}))
    end

    it "responses success response" do
      expect(subject.perform!).to eq({"chart_name" => "bitcoin"})
    end
  end
end
