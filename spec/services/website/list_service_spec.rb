require_relative './../../spec_helper.rb'

describe WebsiteModule::ListService do
  before do
    @company = create(:company)
  end

  describe '#call' do
    it "with list command: With zero websites, return don't find message" do
      @listService = WebsiteModule::ListService.new({}, 'list')

      response = @listService.call()
      expect(response).to match("Nada encontrado")
    end

    it "With two websites, find name and url in response" do
      @listService = WebsiteModule::ListService.new({}, 'list')

      website1 = create(:website, company: @company)
      website2 = create(:website, company: @company)

      response = @listService.call()

      expect(response).to match(website1.name)
      expect(response).to match(website1.url)

      expect(response).to match(website2.name)
      expect(response).to match(website2.url)
    end

    it "with search command: With empty query, return don't find message" do
      @listService = WebsiteModule::ListService.new({'query' => ''}, 'search')

      response = @listService.call()
      expect(response).to match("Nada encontrado")
    end

    it "with search command: With valid query, find name and url in response" do
      website = create(:website, company: @company)

      @listService = WebsiteModule::ListService.new({'query' => website.name}, 'search')

      response = @listService.call()

      expect(response).to match(website.name)
      expect(response).to match(website.url)
    end
  end
end