class ApplicationController < ActionController::API
  SECRETS = 'my$ecretK3y'.freeze

  def user?(user)
    if user
      true
    else
      render json: { error: 'Wrong token!' }, status: :unprocessable_entity
    end
  end

  def auth
    token = request.headers[:token]
    if token
      decoded_token = decrypt(token)
      user_id = decoded_token[0]['user_id']
      user = User.find(user_id)
      user?(user)
    else
      render json: { error: 'Missing token!' }, status: :unprocessable_entity
    end
  end
  # rubocop:disable Style/GuardClause

  def current_user
    token = request.headers[:token]
    if token
      decoded_token = decrypt(token)
      user_id = decoded_token[0]['user_id']
      User.find(user_id)
    end
  end

  # rubocop:enable Style/GuardClause
  def working_day_time
    SpaNSalon.joins('INNER JOIN Work_schedules on spa_n_salons.id = work_schedules.spa_n_salon_id')
      .select('spa_n_salons.id, day, start_time, end_time ')
  end

  def encrypt(payload)
    JWT.encode payload, SECRETS, 'HS256'
  end

  def decrypt(token)
    JWT.decode token, SECRETS, { algorithm: 'HS256' }
  rescue StandardError => e
    e
  end
end
