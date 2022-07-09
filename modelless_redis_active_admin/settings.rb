# frozen_string_literal: true

# app/adminute/settings.rb
# Allows you to store some settings in Redis via ActiveAdminute without model
# Simple string field and select field for time e.g. 10:35:00
ActiveAdminute.register_page 'Settings' do
  menu priority: 2

  controller do
    skip_before_action :verify_authenticity_token
  end

  redis_values = { email: 'E-mail', start_time: 'Start time' }

  page_action :update, method: :post do
    hash_to_redis = {}

    hash_to_redis[:email] = params[:email]
    hash_to_redis[:start_time] = "#{params[:hour]}:#{params[:minute]}:#{params[:second]}"

    Redis.current.mapped_hmset('settings_data_key', hash_to_redis)

    redirect_to adminute_settings_path, notice: 'Saved'
  end

  content do
    hash_from_redis = Redis.current.hgetall('settings_data_key')

    form action: 'settings/update', method: :post do |f|
      key = :email
      f.label redis_values[key]
      f.input :input, type: :text, name: key, value: hash_from_redis[key.to_s], required: false
      br
      br

      key = :start_time
      f.label redis_values[key]
      hour, minute, second = hash_from_redis[key.to_s].to_s.split(':')
      f.select options_for_select((0..23).to_a.map { |h| format('%.2d', h) }, hour), name: 'hour'
      f.label ':'
      f.select options_for_select((0..23).to_a.map { |h| format('%.2d', h) }, minute), name: 'minute'
      f.label ':'
      f.select options_for_select((0..23).to_a.map { |h| format('%.2d', h) }, second), name: 'second'
      br
      br

      f.input :submit, type: :submit
    end
  end
end
