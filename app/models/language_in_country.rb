class LanguageInCountry < ActiveRecord::Base
   belongs_to :country
   belongs_to :language

   def language_name
    language.try(:name)
  end

  def language_name=(name)
    self.language = Language.find_by_name(name) if name.present?
  end
end
