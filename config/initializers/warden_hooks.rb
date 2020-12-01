Warden::Manager.after_set_user do |user, auth, options|
  scope = options[:scope]
  auth.cookies.signed["#{scope}.id"] = user.id
end

Warden::Manager.before_logout do |user, auth, options|
  scope = options[:scope]
  auth.cookies.signed["#{scope}.id"] = nil
end
