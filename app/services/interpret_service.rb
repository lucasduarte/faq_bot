class InterpretService
  def self.call action, params
    case action
    when "list", "search", "search_by_hashtag"
      FaqModule::ListService.new(params, action).call()
    when "create"
      FaqModule::CreateService.new(params).call()
    when "remove"
      FaqModule::RemoveService.new(params).call()
    when "help"
      HelpService.call()
    when "list_website"
      WebsiteModule::ListService.new(params, action).call()
    when "create_website"
      WebsiteModule::CreateService.new(params).call()
    when "remove_website"
      WebsiteModule::RemoveService.new(params).call()
    else
      "Não compreendi o seu desejo"
    end
  end
end