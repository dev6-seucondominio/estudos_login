module SessionsService
  def self.create(params)
    status, resp = User.authenticate(params[:email], params[:password])
    return [:success, resp] if status == :success

    errors = []
    case status
    when :invalid_password
      errors << 'Senha encorreta.'
    when :invalid_email
      errors << 'email encorreta.'
    end

    return [:errors, errors] if errors.any?
    [:success, resp]
  end
end
