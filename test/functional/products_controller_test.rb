require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: { birthday: @product.birthday, body_temperature: @product.body_temperature, can_send_email: @product.can_send_email, country: @product.country, description: @product.description, email: @product.email, favorite_time: @product.favorite_time, graduation_year: @product.graduation_year, name: @product.name, price: @product.price, secret: @product.secret }
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "should update product" do
    put :update, id: @product, product: { birthday: @product.birthday, body_temperature: @product.body_temperature, can_send_email: @product.can_send_email, country: @product.country, description: @product.description, email: @product.email, favorite_time: @product.favorite_time, graduation_year: @product.graduation_year, name: @product.name, price: @product.price, secret: @product.secret }
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end
end
