class Problem < ActiveRecord::Base
  belongs_to :wall
  has_many :completed_problems
  has_many :users, :through => :completed_problems
  has_one :gym, :through => :wall

  validates_inclusion_of :color_one, :color_two, :color_three, :in => Color::CHOICES, :allow_blank => true
  validates_format_of :difficulty, :with => /^V\d+[\+\-]?/
  validates_presence_of :wall_id

  NULL_ATTRS = %w( color_one color_two color_three )
  before_save :nil_if_blank

  def nil_if_blank
    NULL_ATTRS.each { |attr| self[attr] = nil if self[attr].blank? }
  end

  def list_colors
    @color_list = [color_one, color_two, color_three].compact
  end
  
  def name
    list_colors.to_sentence :last_word_connector => ' & ', :two_words_connector => ' & '
  end

  # Test if problem was solved by a specific user
  #
  # Returns true or false
  def solved(user)
    Problem.includes({:completed_problems => :user}).where('users.id = ?', user.id).where(:id => self.id).present?
  end

  def <=>(other)
    Difficulty.to_int(self.difficulty) <=> Difficulty.to_int(other.difficulty)
  end

  include Comparable
end
