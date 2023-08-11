# frozen_string_literal: true

class ToolFacade
  def self.get_tools
    ToolsService.get_tools[:data].map do |tool|
      Tool.new(tool)
    end
  end

  def self.search_tools_by_keyword(keyword, location)
    response = ToolsService.search_tools_by_keyword(keyword, location)
    if response.nil? || !response.key?(:data) || response[:data].empty?
      []
    else
      response[:data].map { |tool| Tool.new(tool) }
    end
  end

  def self.get_tools_by_id(id)
    tool_data = ToolsService.get_tools_by_id(id)[:data][0]
    Tool.new(tool_data)
  end

  def self.users_tools(user_id)
    tools = []
    ToolsService.user_tools(user_id)[:data].select do |tool|
      if tool[:attributes][:borrower_id] == nil
        tools << Tool.new(tool)
      end
    end
    tools
  end

  def self.borrowed_tools(user_id)
    tools = []
    ToolsService.user_tools(user_id)[:data].select do |tool|
      if tool[:attributes][:borrower_id] != nil
        tools << Tool.new(tool)
      end
    end
    tools
  end
end
