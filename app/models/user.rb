class User
  include HTTParty
  attr_accessor :id , :first_name, :last_name, :role, :email

  base_uri "http://identity.spartaglobal.academy/identities"

  def initialize id, first_name, last_name, role, email
    @id = id
    @first_name = first_name
    @last_name = last_name
    @role = role
    @email = email
  end

  def name
    "#{@first_name} #{@last_name}"
  end

  def self.all
    response = User.get("/")

    case response.code
      when 200
        return self.bind_array response.parsed_response
      when 404
        return nil
      when 500...600
        return nil
    end
  end

  def self.find id

    response = User.get("/#{id}")

    case response.code
      when 200
        return self.bind response.parsed_response
      when 404
        return nil
      when 500...600
        return nil
    end
  end

  def self.findByRole role

    response = User.get("/roles/#{role}")

    case response.code
      when 200
        return self.bind_array response.parsed_response
      when 404
        return nil
      when 500...600
        return nil
    end
  end

  def self.bind_array data
    data.map do |item|
      self.bind item
    end
  end

  def self.bind item
    User.new item['_id'], item["first_name"], item["last_name"],item["role"], item["email"]
  end
  
end
