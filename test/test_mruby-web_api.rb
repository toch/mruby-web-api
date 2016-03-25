class TestMrubyWebAPI < MTest::Unit::TestCase
  def setup
    @host = "example.com"
    @prefix = "api"
  end

  def test_root_path
    subject = API.new(@host)
    assert_equal subject.url({}), "https://#{@host}/"
  end

  def test_root_path_with_prefix
    subject = API.new(@host, @prefix)
    assert_equal subject.url({}), "https://#{@host}/#{@prefix}/"
  end

  def test_building_a_path_for_resource
    subject = API.new(@host)
    resource = "test"
    assert_equal subject.to_path({resource.to_sym => nil}), "/#{resource}"
  end

  def test_building_a_path_for_resource_with_id
    subject = API.new(@host)
    resource = "test"
    id = 1
    assert_equal subject.to_path({resource.to_sym => id}), "/#{resource}/#{id}"
  end

  def test_building_a_path_for_nested_resources
    subject = API.new(@host)
    resource = "test"
    id = 1
    child = "child"
    assert_equal subject.to_path({resource.to_sym => id, child.to_sym => id}), "/#{resource}/#{id}/#{child}/#{id}"
  end

  def test_building_a_full_query
    subject = API.new(@host)
    params = { param1: nil, param2: 1, param3: 2}
    assert_equal subject.to_query(params), "?param1&param2=1&param3=2"
  end

end

MTest::Unit.new.run
