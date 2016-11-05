class GuluMessage
  def output_message(context)
    # encoding: utf-8
    require 'faraday'
    require 'json'
    require 'rest-client'
    app_id = ENV['GULU_API_KEY']
    conn = Faraday::Connection.new(url: 'http://api.gnavi.co.jp/RestSearchAPI/20150630/') do |builder|
      builder.use Faraday::Request::UrlEncoded
      builder.use Faraday::Response::Logger
      builder.use Faraday::Adapter::NetHttp
    end

      response = conn.get do |req|
        req.params[:keyid] = app_id
        req.params[:format] = 'json'
        # req.params[:address] = search_place_array[0]
        #req.params[:id] = "g105302"
        req.params[:pref] = "PREF13"
        #req.params[:area] = "AREA150"
        req.params[:hit_per_page] = 2
        # req.params[:freeword_condition] = 2
        req.headers['Content-Type'] = 'application/json; charset=UTF-8'
      end
      json = JSON.parse(response.body)
      image_url1 = json["rest"][0]["image_url"]["shop_image1"].sub!(/http:/, "https:")
      image_url1 = json["rest"][1]["image_url"]["shop_image1"].sub!(/http:/, "https:")

      shop = Shop.where(:name => "YU-YU").first
      j_hash0 = json["rest"][0]["pr"]["pr_short"].scan(/.{1,50}/)
      j_hash1 = json["rest"][1]["pr"]["pr_short"].scan(/.{1,50}/)

      {
        "type": "template",
        "altText": "this is a carousel template",
        "template": {
            "type": "carousel",
            "columns": [
                {
                    "thumbnailImageUrl": json["rest"][0]["image_url"]["shop_image1"],
                    "title": json["rest"][0]["name"],
                    "text": j_hash0[0].to_s,
                    "actions": [
                        {
                            "type": "postback",
                            "label": "Buy",
                            "data": "action=buy&itemid=111"
                        },
                        {
                            "type": "postback",
                            "label": "Add to cart",
                            "data": "action=add&itemid=111"
                        },
                        {
                            "type": "uri",
                            "label": "View detail",
                            "uri": "http://example.com/page/111"
                        }
                    ]
                },
                {
                    "thumbnailImageUrl": json["rest"][1]["image_url"]["shop_image1"],
                    "title": json["rest"][1]["name"],
                    "text": j_hash1[0].to_s,
                    "actions": [
                        {
                            "type": "postback",
                            "label": "Buy",
                            "data": "action=buy&itemid=111"
                        },
                        {
                            "type": "postback",
                            "label": "Add to cart",
                            "data": "action=add&itemid=111"
                        },
                        {
                            "type": "uri",
                            "label": "View detail",
                            "uri": "http://example.com/page/111"
                        }
                    ]
                },
                {
                    "thumbnailImageUrl": "https://pic.prepics-cdn.com/8d1e39b3e24d1/60207519.jpeg",
                    "title": shop.name.to_s,
                    "text": "安くて美味い！",
                    "actions": [
                        {
                            "type": "postback",
                            "label": "Buy",
                            "data": "action=buy&itemid=222"
                        },
                        {
                            "type": "postback",
                            "label": "Add to cart",
                            "data": "action=add&itemid=222"
                        },
                        {
                            "type": "uri",
                            "label": "View detail",
                            "uri": "http://example.com/page/222"
                        }
                    ]
                }
            ]
        }
    }
    end
  end