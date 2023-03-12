class CitizenDateValidator < ActiveModel::Validator
  def validate(record)
    return if record.date_of_birth.blank?
    return unless record.date_of_birth > Time.zone.today

    record.errors.add :base,
                      :the_date_entered_is_greater_than_the_current_date
  end
end
