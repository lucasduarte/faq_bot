module WebsiteModule
  class CreateService
    def initialize(params)
      # TODO: identify origin and set company
      @company = Company.last
      @name = params["name"]
      @url = params["url"]
    end

    def call
      return 'Nome Obrigatório' if @name == nil
      return 'Url Obrigatória' if @url == nil
      Website.transaction do
        website = Website.create(name: @name, url: @url, company: @company)
      end
      "Criado com sucesso"
    end
  end
end