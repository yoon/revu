class Person < ActiveRecord::Base
  # Associations
  has_many :revus
  
  # Instance methods
  def revu_totals
    total = 0.0
    revu_subtotals.map{|d_st| [ d_st[0], total+=d_st[1] ]}
  end
  def revu_total(date = Date.today)
    revu_subtotals.inject(0.0) {|sum, d_st| (d_st[0] <= date.to_date) ? sum + d_st[1] : sum }
  end

  private
  # Private methods
  def revu_subtotals
    h = {}
    revus.each do |revu|
      h[revu.starts_on] ||= 0.0
      h[revu.starts_on] += revu.score
      h[revu.ends_on+1] ||= 0.0
      h[revu.ends_on+1] -= revu.score
    end
    h.sort
  end
end
