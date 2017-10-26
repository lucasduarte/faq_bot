require_relative './../../spec_helper.rb'

describe WebsiteModule::CreateService do
  before do
    @company = create(:company)

    @name = FFaker::Name.name
    @url = FFaker::Internet.http_url
  end

  describe '#call' do
    it 'without name, will receive an error' do
      @createService = WebsiteModule::CreateService.new({"url" => @url})

      response = @createService.call()
      expect(response).to match("Nome Obrigatório")
    end

    it 'without url, will receive an error' do
      @createService = WebsiteModule::CreateService.new({"name" => @name})
      
      response = @createService.call()
      expect(response).to match("Url Obrigatória")
    end

    it 'with valid params, receive success message' do
      @createService = WebsiteModule::CreateService.new({"name" => @name, "url" => @url})
    
      response = @createService.call()
      expect(response).to match("Criado com sucesso")
    end
  end
end