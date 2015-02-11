require "minitest"
require "minitest/spec"
require "minitest/autorun"

describe "Bundler bug" do
  it "doesn't load minitest" do
    true.must_equal(false)
  end
end
