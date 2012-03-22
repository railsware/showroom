class ProductPresenter < BasePresenter
  presents :product
  delegate :name, :image, :description, :price, :to => :product
  
  def currency_price
    h.number_to_currency product.price
  end
  
  def thumbnail
    h.image_tag(product.image? ? product.image.thumb.url : "http://placehold.it/200x200")
  end
  
  def thumbnail_with_link
    if product.image?
      h.link_to product.image.url do
        self.thumbnail
      end
    else
      self.thumbnail
    end
  end
  
end