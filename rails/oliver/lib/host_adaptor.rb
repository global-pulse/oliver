class HostAdaptor
  def get(uri)
    result = Net::HTTP.start(uri.host, uri.port) do |http|
      http.get "#{uri.path}?#{uri.query}"
    end
    result.body
  end
end