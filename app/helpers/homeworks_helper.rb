module HomeworksHelper
  def label_for_status(status)
    case status
      when :all then 'success'
      when :some then 'warning'
      when :none then 'important'
    end
  end

  def display_for_status(status)
    case status
      when :all then "All submitted"
      when :some then "Still missing"
      when :none then "No submissions"
    end
  end
end
