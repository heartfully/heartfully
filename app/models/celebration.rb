class Celebration < Registry
  def display_name
    name
  end

  def reference_name
    registrant_first_name.present? ? registrant_first_name : name
  end
end
