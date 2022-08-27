# Observer Pattern
# Date: 29-Aug-2022
# Authors:
#          A01377950 Zabdiel Valentín Garduño Vivanco
#          A01377942 Luis Jonathan Rosas Ramos
#          A01377072 Emiliano Heredia García
#require 'observer'


class Twitter

    #This attr_reader property allows internal attributes to be in read-only mode.
    attr_reader :texto, :name,:observers

    #Initialize the constructor, it receives the name of this account. It initializes the array with the observers.
    def initialize(name)
      @name = name
      @observers = []
    end

    #This method allows adding some observers. Specifically, it adds to this account a new follower.
    def add_observer(observer)
         @observers << observer
    end
   
    #Post a new tweet, all the followers from this account will notice it.
    def tweet(texto)
        @texto=texto
        notify_observers
    end

    #Follow a twitter account, it receives the account you want to follow, access its method add_observer, and then adds this account (self).
    def follow(twitter_account)
        twitter_account.add_observer(self)
        return self
    end

    #Wherever an account you follow posts a new tweet automatically this method is called, it receives the account that posted the tweet.
    def imprimir_tweets(twitter_account)
        puts("#{self.name} received a tweet from #{twitter_account.name}: #{twitter_account.texto}")
    end

    #Any time you publish a new tweet, all your followers will notice it. It iterates through the array of observers (followers) and calls the method imprimir_tweets.
    def notify_observers
        @observers.each do |observer|
          observer.imprimir_tweets(self)
        end
    end

end