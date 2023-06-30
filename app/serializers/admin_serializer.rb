class AdminSerializer < ActiveModel::Serializer
  attributes :username, :logged_in

  def logged_in
    @instance_options[:logged_in]
  end
end