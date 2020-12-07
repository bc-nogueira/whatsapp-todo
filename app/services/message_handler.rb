class MessageHandler
  OPTIONS = "You have the following options:\n"\
            "*List* - List all items\n"\
            "*Add item_name* - Add an item\n"\
            "*Delete item_number* - Delete item with given item number\n"\
            "*Complete item_number* - Mark that item complete\n"\
            "*Help* - Show instructions\n"\
            "*About* - Show informations about this chat bot\n"

  attr_accessor :body, :response

  def initialize(body)
    @body = body
  end

  def call
    return display_help if body.include?('help')
    return create_item if body.include?('add')
    return destroy_item if body.include?('delete')
    return list_items if body.include?('list')
    return complete_item if body.include?('complete')
    return display_info if body.include?('about')
    invalid_option
  end

  private

  def display_help
    OPTIONS
  end

  def create_item
    item_name = body.remove('add').strip
    Item.create(name: item_name, completed: false)
    'Item created succesfully.'
  end

  def destroy_item
    item_id = body.remove('delete').strip
    Item.find(item_id).destroy
    'Item deleted succesfully.'
  end

  def list_items
    response_str = "Items:\n"
    Item.all.each do |item|
      line = "#{item.id} - #{item.name}"
      response_str.concat(item.completed ? "~#{line}~\n" : "#{line}\n")
    end
    response_str.strip
  end

  def complete_item
    item_id = body.remove('complete').strip
    item = Item.find(item_id)
    return 'Item is already completed.' if item.completed
    item.update(completed: true)
    'Item marked as completed.'
  end

  def invalid_option
    "Invalid input.\n#{OPTIONS}"
  end

  def display_info
    "This chatbot was created by Breno Nogueira with ❤ - 2020\n"\
    "www.bcnogueira.com.br"
  end
end
