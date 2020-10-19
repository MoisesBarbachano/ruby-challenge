class SearchController < ApplicationController
  def index
    engine_param = search_params[:engine]
    value = search_params[:value]

    engines =
      case engine_param
      when 'both'   then [Google.new(value), Bing.new(value)]
      when 'google' then Google.new(value)
      when 'bing'   then Bing.new(value)
      else return render nothing: true, status: :not_found
      end

    requested_engines = Engine.new(engines)

    render json: requested_engines.search
  end

  private

  def search_params
    params.require(:engine)
    params.require(:value)
    params.permit(
      :engine,
      :value
    )
  end
end
