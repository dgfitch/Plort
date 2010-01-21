require 'lib/telescope/telescope'


describe("Integration tests", function()

  context("YAY", function()

    it("is running inside LOVE")
    it("works normally", function()
      assert_greater_than(2, 1)
    end)
    it("blows up", function()
      assert_true(false)
    end)

  end)

  context("more", function()

    it("tests the clicker")
    it("likes pickles")

  end)
end)

