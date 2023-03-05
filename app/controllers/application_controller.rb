
class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  # add routes
  get '/bakeries' do
    bakeries = Bakery.all
    bakeries.to_json
  end

  get '/bakeries/:id' do
    bakery = Bakery.find(params[:id])
    bakery.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    baked_good_by_price = BakedGood.all.order('price DESC')
    baked_good_by_price.to_json
  end

  get '/baked_goods/most_expensive' do
    most_expensive_baked_good = BakedGood.all.order('price DESC').limit(1)
    most_expensive_baked_good.to_json
  end

end
