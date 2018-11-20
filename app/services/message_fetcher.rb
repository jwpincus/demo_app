class MessageFetcher
  include HTTParty
  base_uri 'https://devtestapiapp.herokuapp.com'
  TRANSLATED_KEYS = {
    'id': 'user_id',
    'created_at': 'external_created_at',
    'followers': 'user_followers'
  }

  def self.messages
    fetch_messages
    return Message.all
  end

  def self.fetch_messages
    response = get('/tweets.json')
    return if response.parsed_response.class == Hash && response['error'] # API will respond with 200 code on error, has to be checked manually and not against response code
    json = parse_json(response.parsed_response)
    bulk_create_messages(json)
  end

  def self.parse_json(raw_response)
    response = raw_response.map do |message|
      message.transform_keys! do |key|
        key = MessageFetcher::TRANSLATED_KEYS[key.to_sym] || key
      end
      message.except!('updated_at') # removes updated_at to prevent overwriting in our own DB accidentally
    end
    return response
  end

  def self.bulk_create_messages(clean_json)
    Message.create(clean_json)
  end

end
