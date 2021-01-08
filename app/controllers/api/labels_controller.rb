class Api::LabelsController < ActionController::Base
    protect_from_forgery with: :null_session
    skip_before_action :verify_authenticity_token
    def create
        @label = params['label']
        notifier = Slack::Notifier.new ENV['SLACK_WEBHOOK'] do
            defaults channel: "#default",
                     username: "notifier"
          end
          notifier.ping "This pr is ready for review"
 
    end
end