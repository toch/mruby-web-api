class API
  def initialize(host, path_prefix = "", header = {})
    @host = host.dup
    @path_prefix = ""
    unless path_prefix.empty?
      @path_prefix << "/" if path_prefix[0] != "/"
      @path_prefix << "#{path_prefix}"
    end
    @header = header.dup
    @http_request = HttpRequest.new()
  end

  def url(resources, params = nil)
    str = "https://#{@host}#{@path_prefix}#{to_path(resources)}#{to_query(params)}"
    str
  end

  def to_query(params)
    str = ""
    if params && !params.empty?
      str << "?"
      str << params.map do |param, value|
        param_str = "#{param}"
        param_str << "=#{@http_request.escape(value)}" unless value.nil?
        param_str
      end.join("&")
    end
    str
  end

  def to_path(resources)
    str = ""
    resources.each do |resource, id|
      str << "/#{resource}"
      str << "/#{id}" if id
    end
    str
  end

  def get(url)
    JSON::parse @http_request.get(
      url,
      nil,
      @header
    ).body
  end

end
