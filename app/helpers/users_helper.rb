module UsersHelper
  def error_handler(err)
    if err.errors.any?
      err.errors.full_messages.each do |message|
        message
      end
    end
  end
end
