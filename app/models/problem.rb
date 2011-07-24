class Problem < ActiveRecord::Base
  default_scope :order => 'difficulty_position'
  
  belongs_to :wall
  has_many :completed_problems
  has_many :users, :through => :completed_problems

  validates_inclusion_of :color_one, :color_two, :color_three, :in => Color::CHOICES, :allow_blank => true

  def list_colors
    @color_list = [color_one, color_two, color_three].compact
  end
  
  def name
    list_colors.to_sentence :last_word_connector => ' & ', :two_words_connector => ' & '
  end
  
  def difficulty_sort
    plus_minus_hash = { "-"=>0, ""=>1, "+"=>2 }
    
    r = /(V)(\d{1,2})([+-]*)/
    m = r.match difficulty
    @order = (m[2] * 3) + plus_minus_hash[m[3]]
  end
  
end
