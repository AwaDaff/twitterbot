require 'Twitter' 
while true
    begin
        config = {
            consumer_key:        '',
            consumer_secret:     '',
            access_token:        '',
            access_token_secret: ''
        }
        rClient = Twitter::REST::Client.new config
        sClient = Twitter::Streaming::Client.new(config)

        topics = ['#vans', '#lifestyle', '#cool']
        sClient.filter(:track => topics.join(',')) do |tweet|
            if tweet.is_a?(Twitter::Tweet)
              puts tweet.text 
              rClient.fav tweet
              rClient.update_with_media("@#{tweet.user.screen_name} Bénécifiez d'une offre de promo jusqu'à -50% sur les chaussures vans" , File.new("/Users/AWA/Downloads/VANS-Sale-22-Aug-2015.jpg "))
              sleep 900
            end
        end
    rescue
        puts 'error occurred, waiting for 5 seconds'
        sleep 5
    end

end