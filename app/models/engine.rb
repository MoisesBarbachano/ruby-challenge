class Engine
  def initialize(adapter)
    @adapter = adapter
  end

  def search
    response = {}

    return @adapter.search unless @adapter.kind_of?(Array)

    @adapter.each do |engine|
      response[:google] = engine.search if engine.name == 'google'
      response[:bing] = engine.search if engine.name == 'bing'
    end

    response
  end
end
