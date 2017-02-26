class Pagination
  def initialize(items, size, page)
    @items = items
    @size, @page = size, page
    @last_num, @init_num, @limit_num = find_last_num, find_init_num, find_limit_num
  end

  attr_reader :size, :page, :last_num, :init_num, :limit_num
  attr_accessor :items

  def paginate
    puts init_num

    i, new_items_arr = init_num, Array.new
    while i <= pag_last_item
      new_items_arr.push(items[i])
      i += 1
    end

    new_items_arr
  end

  private
  def find_last_num; items.count-1; end
  def find_init_num; size.to_i * page.to_i - size.to_i; end
  def find_limit_num; size.to_i * page.to_i - 1; end

  def pag_last_item; [last_num, limit_num].min; end
end

items = [
    {id: 1, name: 'some title'},    # 0
    {id: 3, name: 'another title'}, # 1
    {id: 6, name: 'third title'},   # 2

    {id: 7, name: 'something new'}, # 3
    {id: 9, name: 'again post'},    # 4
    {id: 12, name: 'revolution'},   # 5

    {id: 13, name: 'love world'},   # 6
    {id: 14, name: 'aaa! last!'}    # 7
]
size, page = 3, 3

records = Pagination.new(items, size, page)
puts records.paginate # 7, 8
