class Function < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    ident :string
    name :string
    description :text
    timestamps
  end
  attr_accessible :ident, :name, :description, :function_type, :function_type_id

  belongs_to :sub_system, :creator => :true, :inverse_of => :functions
  belongs_to :function_type, :inverse_of => :functions

  validates_uniqueness_of :ident, :scope => :sub_system_id

  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?
  end

  def update_permitted?
    acting_user.administrator? && !sub_system_changed?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end
