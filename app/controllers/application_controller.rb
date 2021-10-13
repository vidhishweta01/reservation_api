# frozen_string_literal: true

class ApplicationController < ActionController::API
  SECRETS = 'my$ecretK3y'

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

  def owner_is_correct(spa_id)
    spa_id = params[:spa_n_salon_id]
    @owner = SpaNSalons.where(id: spa_id).pluck(:owner_id)
    @current_owner = current_user.owner if current_user
    @owner == @current_owner
  end
  # rubocop:enable Style/GuardClause

  def encrypt(payload)
    JWT.encode payload, SECRETS, 'HS256'
  end

  def decrypt(token)
    JWT.decode token, SECRETS, { algorithm: 'HS256' }
  rescue StandardError => e
    e
  end
end
