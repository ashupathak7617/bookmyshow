require "sidekiq"

class SendActivityToAppJob
  include Sidekiq::Job

  def perform(*args)
    url = URI("#{ENV.fetch('BASE_URL')}/health")

    response = Net::HTTP.get_response(url)

    if response.is_a?(Net::HTTPSuccess)
      Rails.logger.info("[SendActivityToAppJob] Health check successful: #{response.code}")
    else
      Rails.logger.warn("[SendActivityToAppJob] Health check failed: #{response.code}")
    end
  rescue => e
    Rails.logger.error("[SendActivityToAppJob] Error hitting health endpoint: #{e.message}")
  end
end