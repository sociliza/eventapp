class Business < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :profile, as: :profileable, dependent: :destroy
  has_one :place, as: :placeable, dependent: :destroy

  belongs_to :plan

  # events
  has_many :events, dependent: :destroy

  validates :company_name, presence: true


  def to_s
  	company_name
  end

  def date_difference(date1, date2)
    month = (date2.year - date1.year) * 12 + date2.month - date1.month- (date2.day >= date1.day ? 0 : 1)
  end

  def free_trial
    month = date_difference(self.created_at, Date.today)
    if month >= 1
      return false
      errors.add(:trial_end, "Your Free Trial has Ended, please select from a plan")
    elsif month < 1
      return true
    end
  end

  def if_amount_pending
    trial = self.free_trial
    if (trial == false && self.active?)
      last_transaction = Transaction.where(:business_id => self.id).last 
      if date_difference(last_transaction.created_at, Date.today) >= 1
        errors.add(:pending, "You have an outstanding invoice, kindly pay at the earlist.")
        true
      end
    end
  end

  def credit_card_valid
    date = Date.today
    year = self.year
    month = self.month
    expiry_month = (date.year - year) * 12 + date.month - month
    if expiry_month > 6
      true
    elsif expiry_month < 6
      false
      errors.add(:transaction, "Credit Card not valid")
    end
  end

  def charge_credit_card
    trial = self.free_trial
    if_amount_pending = self.if_amount_pending
    credit_card_valid = self.credit_card_valid
    if (trial == false && self.active? && if_amount_pending == true && credit_card_valid == true)
      plan_id = self.plan_id
      plan = Plan.where(:id => plan_id).first
      transaction = Transaction.new
      transaction.attributes(business_id: self.id, first_name: self.first_name, last_name: self.last_name,
        card_type: self.card_type, card_number: self.card_number, cvv: self.cvv, month: self.month, year: self.year, amount: plan.price)
      if transaction.save!
        transaction.status = true
        transaction.update
      else
        transaction.status = false
        transaction.update
        errors.add(:transaction, "Credit Card Could not be Charged")
      end
    end
  end
    
end
