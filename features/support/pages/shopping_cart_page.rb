
class ShoppingCartPage
  include PageObject
  include Buttons

  NAME_COLUMN = 1
  SUBTOTAL_COLUMN = 3
  LINES_PER_PUPPY = 6

  button(:proceed_to_checkout, :value => COMPLETE_ADOPTION )
  button(:continue_adopting, :value => ADOPT_ANOTHER)
  table(:cart, :index => 0)
  cell(:cart_total, :class => "total_cell")

  def name_for_line_item(line_item)
    cart_line_item(line_item)[NAME_COLUMN].text
  end

  def subtotal_for_line_item(line_item)
    cart_line_item(line_item)[SUBTOTAL_COLUMN].text
  end


  private

  def row_for(line_item)
    (line_item - 1) * LINES_PER_PUPPY
  end

  def cart_line_item(line_item)
    @browser.table(:index => 0)[row_for(line_item)]
  end




end