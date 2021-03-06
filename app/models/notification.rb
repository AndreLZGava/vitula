class Notification < ActiveRecord::Base
  
  has_paper_trail
  
  belongs_to :user

  ########################################Variables###################################################
  @login 		= Time.now.to_date - 90.days
  @limit 		= Time.now + 30.days
  @heat  		= Time.now - Reproduction.class_variable_get(:@@heat) + 7.days
  @parturition  = Time.now - Reproduction.class_variable_get(:@@parturition) + 14.days

  ########################################Methods###################################################

  def self.create(notification_params)
    @notification = Notification.new(notification_params)
    @notification.save
  end

  def self.verify_heat
  	@users = User.all

  	@users.each do |user|
  		@animals = Animal.parturition(user, Time.now)

  		@animals.each do |animal|
  			Notification.create(title: I18n.t('activerecord.models.notify_heat_title', :animal_name => "#{animal.name}") , description: I18n.t('activerecord.models.notify_heat_description', :animal_name => "#{animal.name}", :animal_code => "#{animal.code}", :user_name => "#{user.name}"), limit: @limit, user_id: user.id)
  		end
  	end
  end

  def self.verify_stop
    @users = User.all

    @users.each do |user|
      @animals = Animal.stop(user, Time.now)

      @animals.each do |animal|
        Notification.create(title: I18n.t('activerecord.models.notify_stop_title', :animal_name => "#{animal.name}") , description: I18n.t('activerecord.models.notify_stop_description', :animal_name => "#{animal.name}", :animal_code => "#{animal.code}", :user_name => "#{user.name}"), limit: @limit, user_id: user.id)
      end
    end
  end

   def self.verify_parturition
  	@users = User.all

  	@users.each do |user|
  		@animals = Animal.parturition(user, Time.now)

  		@animals.each do |animal|
  			Notification.create(title: I18n.t('activerecord.models.notify_parturition_title', :animal_name => "#{animal.name}") , description: I18n.t('activerecord.models.notify_parturition_description', :animal_name => "#{animal.name}", :animal_code => "#{animal.code}", :user_name => "#{user.name}"), limit: @limit, user_id: user.id)
  		end
  	end
  end
  
end
