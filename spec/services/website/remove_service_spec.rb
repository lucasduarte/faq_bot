require_relative './../../spec_helper.rb'

describe WebsiteModule::RemoveService do
  before do
    @company = create(:company)
  end

  describe "#call" do
    it "with valid ID, remove website" do
      website = create(:website, company: @company)

      @removeService = WebsiteModule::RemoveService.new({"id" => website.id})
      response = @removeService.call()

      expect(response).to match("Deletado com sucesso")
    end

    it "With invalid ID, receive error message" do
      @removeService = WebsiteModule::RemoveService.new({"id" => rand(1..9999)})
      response = @removeService.call()

      expect(response).to match("Website inválido, verifique o Id")
    end

    it "With valid ID, remove website from database" do
      website = create(:website, company: @company)
      @removeService = WebsiteModule::RemoveService.new({"id" => website.id})

      expect(Website.all.count).to eq(1)
      response = @removeService.call()
      expect(Website.all.count).to eq(0)
    end
  end
end