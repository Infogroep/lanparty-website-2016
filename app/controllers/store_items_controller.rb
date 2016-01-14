class StoreItemsController < ApplicationController
  before_filter :find_store_item, only: []

  def tree
    @store_item_classes = StoreItemClass.where(parent: nil)
  end

  private
  def find_store_item
    @store_item = StoreItem.find(params[:id])
  end
end