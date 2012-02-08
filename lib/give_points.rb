class GivePoints
  def self.given_point_create_or_destroy(object, user, up)
    object_id = (object.class.to_s.downcase + "_id").to_sym
      gp = GivenPoint.where(:user_id => user.id, object_id => object.id).last
      operator = up ? + 1 : - 1
      if gp.nil?
        GivenPoint.create!(:user_id => object.user.id, object_id => object.id, :giver_id => user.id, :up => up)
        object.user.points = operator + object.user.points
        object.user.save
        object.points = operator + object.points
        object.save
      else
        object.user.points = operator + object.user.points
        object.user.save
        object.points = operator + object.points
        object.save
        gp.destroy
      end
  end
  def self.nake
    1
  end

  def self.add(object, user)
    unless user == object.user
       given_point_create_or_destroy(object, user, true)
    end
  end

  def self.remove(object, user)
    unless user == object.user
     given_point_create_or_destroy(object, user, false)
    end
  end

  def self.add_on_create(object)
    object.points = 0
  end

end