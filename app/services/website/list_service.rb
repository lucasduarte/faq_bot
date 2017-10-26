module WebsiteModule
  class ListService
    def initialize(params, action)
      @company = Company.last
      @action = action
      @query = params["query"]
    end

    def call
      if @action == "search"
        websites = Website.search(@query).where(company: @company)
      else
        websites = @company.websites
      end

      response = "*Websites* \n\n"
      websites.each do |w|
        response += "*#{w.id}* - "
        response += "*#{w.name}*\n"
        response += ">#{w.url}\n\n"
      end

      websites.count > 0 ? response : "Nada encontrado."
    end
  end
end
