class SavedController < ApplicationController

  def index
    @saved = Saved.all
  end

  def create
    product = Product.find(params[:product])
    Saved.create(product_id: product.id, image_url: product.image_url, price: product.price, name: product.name)
    redirect_to root_path
  end
end
