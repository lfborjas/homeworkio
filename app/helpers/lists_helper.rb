module ListsHelper
  def label_for_student(unique_subs, total_subs)
    if unique_subs < total_subs
      'important'
    else
      'success'
    end
  end
  
  def display_for_student(unique_subs, total_subs)
    "#{unique_subs}/#{total_subs}"
  end
end
