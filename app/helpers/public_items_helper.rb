module PublicItemsHelper
 # itemを一つ引数に取る
  def addTax(item)
    (item.non_taxed_price * 1.1)
  end
end
