class Amberlock

  def initialize(amber_code = 'AO-d04cbdb353a7', api_key = 'bcxfpb7Um2sFy7ozcjGV')
    @api_key = api_key
    @amber_code = amber_code
    @subscribe_url = 'http://amberlock.herokuapp.com/api/amber_users'
    @request_unlock_url = 'http://amberlock.herokuapp.com/api/unlock'
  end

  def subscribe_user(mobile, email)
    RestClient.post "#{@subscribe_url}", "api_key=#{@api_key}&amber_code=#{@amber_code}&mobile=#{mobile}&email=#{email}"
  end

  def request_unlock(mobile, email)
    RestClient.post "#{@request_unlock_url}", "api_key=#{@api_key}&amber_code=#{@amber_code}&mobile=#{mobile}&email=#{email}"
  end

end
