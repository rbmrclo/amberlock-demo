class Amberlock

  def initialize(api_key = 'rPLqG41JuX2k8hC2woZq', amber_code = 'DA-54ad0e02e5df')
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
