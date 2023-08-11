# frozen_string_literal: true

class ToolsService
  def self.user_tools(user_id)
    response = conn.get("/api/v1/users/#{user_id}/tools")
    begin
      JSON.parse(response.body, symbolize_names: true)
    rescue JSON::ParserError
    []
    end
  end

  def self.search_tools_by_keyword(keyword, location)
    response = conn.get("/api/v1/tools/search?name=#{keyword}&location=#{location}")
    begin
      JSON.parse(response.body, symbolize_names: true)
    rescue JSON::ParserError
      {}
    end
  end

  def self.get_tools_by_id(id)
    response = conn.get("/api/v1/tools/#{id}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_tools
    response = conn.get('/api/v1/tools')
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.post_tool(attributes, user_id)
    response = conn.post do |r|
      r.url "/api/v1/users/#{user_id}/tools"
      r.headers['Content-Type'] = 'application/json'
      r.body = attributes.to_json
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.conn
    # Faraday.new(url: "http://localhost:3000")
    Faraday.new(url: 'https://lend-a-toolza-be.onrender.com')
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
