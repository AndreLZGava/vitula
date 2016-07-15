class Animal < ActiveRecord::Base

  belongs_to :lot
  belongs_to :user
  belongs_to :reproduction

  has_many :reproductions_as_father, class_name: 'Reproduction',  foreign_key: 'father_id'
  has_many :reproductions_as_mother, class_name: 'Reproduction',  foreign_key: 'mother_id'
  has_many :developments, dependent: :destroy
  has_many :productions, dependent: :destroy

  has_paper_trail

  validates :code, presence: true
  validates :name, presence: true
  validates :breed, presence: true

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "30x30#" }, default_url: "/images/:style/missing_animal.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
  crop_attached_file :photo

  def reproductions
    Reproduction.where('mother_id = ? or father_id = ?', id, id)
  end

  def average_month(date)
    all_of_them = self.productions.where('measurement >= ? and measurement <= ?', date.beginning_of_month, date.end_of_month)
    return all_of_them.empty? ? 0 : all_of_them.average(:amount)
  end

  def average_year
    data = {}
    on_time = 1..12
    on_time.each do |t|
      on_date = Time.now - t.months
      data[t] = { on_date.strftime("%B, %Y") => self.average_month(on_date) }
    end
    return data
  end

end
