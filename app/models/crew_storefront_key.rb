class CrewStorefrontKey < ApplicationRecord
  belongs_to :crew
  validates_presence_of :crew_id, :public_key, :secret_key
  validates_uniqueness_of :public_key, :secret_key

  def self.initiate_credentials_for crew
    if crew == Crew.find(crew.id)
      credentials = CrewStorefrontKey.new(crew: crew)
      CrewStorefrontKey.credentials_proposal credentials
    else
      CrewStorefrontKey.notAnValidInstanceExeception crew, "Crew"
    end
  end

  def self.check_credentials_and_return_crew public_key, secret_key
    result = false
    if CrewStorefrontKey.exists?(public_key: public_key)
      crew_credetials = CrewStorefrontKey.find_by(public_key: public_key)
      if crew_credetials.secret_key == secret_key
        result = crew_credetials.crew.id
      end
    end
    return result
  end

  private
  def self.notAnValidInstanceExeception obj, valid_class
    raise "Object passed (#{obj}) is not an existing instance of the class #{valid_class}"
  end

  def self.credentials_proposal credentials
    credentials.public_key = SecureRandom.urlsafe_base64(10)
    credentials.secret_key = SecureRandom.urlsafe_base64(20)
    CrewStorefrontKey.do_or_retry_to_create credentials
  end

  def self.do_or_retry_to_create credentials
    if credentials.class.name == "CrewStorefrontKey"
      if CrewStorefrontKey.credentials_valid? credentials
        credentials.save
        puts "credentials for #{credentials.crew.name} created. public_key: #{credentials.public_key}, secret_key: #{credentials.secret_key}"
        return credentials
      else
        CrewStorefrontKey.credentials_proposal credentials
      end
    else
      CrewStorefrontKey.notAnValidInstanceExeception credentials, "CrewStorefrontKey"
    end
  end

  def self.credentials_valid? credentials
    validity = false
    unless CrewStorefrontKey.exists?(public_key: credentials.public_key) || CrewStorefrontKey.exists?(secret_key: credentials.secret_key)
      validity = true
    end
    return validity
  end

end
