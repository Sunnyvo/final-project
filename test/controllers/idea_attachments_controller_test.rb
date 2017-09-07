require 'test_helper'

class IdeaAttachmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @idea_attachment = idea_attachments(:one)
  end

  test "should get index" do
    get idea_attachments_url
    assert_response :success
  end

  test "should get new" do
    get new_idea_attachment_url
    assert_response :success
  end

  test "should create idea_attachment" do
    assert_difference('IdeaAttachment.count') do
      post idea_attachments_url, params: { idea_attachment: { idea_id: @idea_attachment.idea_id, photo: @idea_attachment.photo } }
    end

    assert_redirected_to idea_attachment_url(IdeaAttachment.last)
  end

  test "should show idea_attachment" do
    get idea_attachment_url(@idea_attachment)
    assert_response :success
  end

  test "should get edit" do
    get edit_idea_attachment_url(@idea_attachment)
    assert_response :success
  end

  test "should update idea_attachment" do
    patch idea_attachment_url(@idea_attachment), params: { idea_attachment: { idea_id: @idea_attachment.idea_id, photo: @idea_attachment.photo } }
    assert_redirected_to idea_attachment_url(@idea_attachment)
  end

  test "should destroy idea_attachment" do
    assert_difference('IdeaAttachment.count', -1) do
      delete idea_attachment_url(@idea_attachment)
    end

    assert_redirected_to idea_attachments_url
  end
end
