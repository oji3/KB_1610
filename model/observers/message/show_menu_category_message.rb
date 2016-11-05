
class ShowMenuCategoryMessage
  def update(changed_callback)
    event = changed_callback.event

    if Message.is_postback?(event)
      hash = Message.convert_hash(event)
      if hash['action'] == 'show_menu_category'
        Message.reply(event, output)
      end
    elsif Message.is_message?(event)
      if event.message['text'].include?("カテゴリー")
        Message.reply(event, output)
      end
    end
  end

  def output
    {
        "type": "template",
        "altText": "this is a category message",
        "template": {
            "type": "buttons",
            "text": "カテゴリーを選んだください",
            "actions": [
                {
                    "type": "postback",
                    "label": "丼",
                    "data": "action=ordercategory=DON"
                },
                {
                    "type": "postback",
                    "label": "麺類",
                    "data": "action=order&category=MEN"
                },
                {
                    "type": "postback",
                    "label": "デザート",
                    "data": "action=order&category=DES"
                },
                {
                    "type": "postback",
                    "label": "もどる",
                    "data": "action=welcome"
                }
            ]
        }
    }
  end
end