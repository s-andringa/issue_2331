require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "should invalidate numericality of associated chapter's nr_of_pages attribute when changed from a positive integer to a string" do
    assert_invalid_when_changed_from(10)
  end

  test "should invalidate numericality of associated chapter's nr_of_pages attribute when changed from zero to a string" do
    assert_invalid_when_changed_from(0)
  end

  def assert_invalid_when_changed_from(nr)
    book    = Book.create!
    chapter = book.chapters.create! :nr_of_pages => nr
    book.chapters_attributes = [{:id => chapter.id, :nr_of_pages => "abc"}]
    assert !book.valid?, "Book is not invalid"
    assert_equal ["is not a number"], book.errors["chapters.nr_of_pages"], "Book has no errors on \"chapters.nr_of_pages\""
  end
end
