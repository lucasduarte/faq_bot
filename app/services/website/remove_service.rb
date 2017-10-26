module WebsiteModule
  class RemoveService
    def initialize(params)
      @company = Company.last
      @params = params
      @id = params["id"]
    end

    def call
      begin
        website = @company.websites.find(@id)
      rescue
        return "Website inválido, verifique o Id"
      end

      Website.transaction do
        website.delete
      end
      return "Deletado com sucesso"
    end
  end
end