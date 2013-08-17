class Amberlock

  def initialize(api_key = 'bcxfpb7Um2sFy7ozcjGV', amber_code = 'A2-3e4c973ff411')
    @api_key = api_key
    @amber_code = amber_code
    @subscribe_url = 'http://amberlock.herokuapp.com/api/amber_users'
    @request_unlock_url = 'http://amberlock.herokuapp.com/api/unlock'
  end

  def subscribe_user(mobile, email)
    RestClient.post "#{@subscribe_url}", "api_key=#{@api_key}&amber_code=#{@amber_code}&mobile=#{mobile}&email=#{email}"
    Rails.logger.info "=== User subscribed to amber project ==="
  end

  def request_unlock(mobile, email)
    RestClient.post "#{@request_unlock_url}", "api_key=#{@api_key}&amber_code=#{@amber_code}&mobile=#{mobile}&email=#{email}"
    Rails.logger.info "=== Request unlock sent ==="
  end

end
