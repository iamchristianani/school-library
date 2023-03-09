require './app'

def main
  Main.new
end

class Main
  puts "Welcome to school library app!\n\n"
  def menu
    puts
    puts 'Please choose an option by entering a number'
    @list = {
      1 => 'List all books',
      2 => 'List all people',
      3 => 'Create a person',
      4 => 'Create a book',
      5 => 'Create a rental',
      6 => 'List all rentals for a given person id',
      7 => 'Exit'
    }
    @list.each do |id, option|
      puts "#{id}: #{option}"
    end
    num = gets.chomp.to_i
  end
  def start
    res = App.new
    loop do
      case menu
      when 1
        res.list_books
      when 2
        res.list_people
      when 3
        res.create_person
      when 4
        res.create_book
      when 5
        res.create_rental
      when 6
        res.list_rental_of_person
      when 7
        puts 'Thank you for using this app!'
        exit
      else
        puts 'Please choose a number between 1 and 7'
      end
    end
  end
end
main.start