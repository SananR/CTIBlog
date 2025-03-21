require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @category = Category.new(name: "Travel", id: 1)
    @admin_user = User.create(username: "admin", email: "admin@exampl.com", password: "password", admin: true)
  end

  test "should get index" do
    get categories_url
    assert_response :success
  end

  test "should get new" do
    sign_in_as(@admin_user)
    get new_category_url
    assert_response :success
  end

  test "should create category" do
    sign_in_as(@admin_user)
    assert_difference("Category.count", 1) do
      post categories_url, params: { category: { name: "Gaming" } }
    end

    assert_redirected_to category_url(Category.last)
  end

  test "should not create category if not admin" do
    assert_no_difference("Category.count") do
      post categories_url, params: { category: { name: "Gaming" } }
    end

    assert_redirected_to categories_url
  end

  # test "should get show" do
  #   get category_path(@test)
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get edit_category_url(@category)
  #   assert_response :success
  # end

  # test "should update category" do
  #   patch category_url(@category), params: { category: {} }
  #   assert_redirected_to category_url(@category)
  # end

  # test "should destroy category" do
  #   assert_difference("Category.count", -1) do
  #     delete category_url(@category)
  #   end

  #   assert_redirected_to categories_url
  # end

end
