require './person'
require './rental'
require './book'
require './classroom'
require './student'
require './teacher'
require './nameable'
require './save'
require './read_data'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def fetch_all_data
    people_data = ReadData.new
    @people = people_data.read_data('people.json')
    @books = people_data.read_data('books.json')
  end

  def list_books
    if @books.empty?
      puts 'There are no books'
    else
      @books.each do |each_book|
        puts "Title: \"#{each_book['title']}\", Author: \"#{each_book['author']}\""
      end
    end
  end

  def list_people
    if @people.empty?
      puts 'There are no people'
    else
      @people.each do |each_person|
        puts "[#{each_person['class']}] Name:#{each_person['name']}, ID: #{each_person['id']}, Age:#{each_person['age']}"
      end
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    number = gets.chomp.to_i
    case number
    when 1
      create_student
    when 2
      create_teacher
    end
  end

  def fetch_student_details
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp
    { age: age, name: name, parent_permission: parent_permission }
  end

  def create_student
    student_details = fetch_student_details
    each_student = Student.new(student_details[:age], student_details[:name], student_details[:parent_permission])
    student_hash = {
      'class' => each_student.class,
      'name' => each_student.name,
      'id' => each_student.id,
      'age' => each_student.age
    }
    @people << student_hash
    puts 'Person created successfully'
  end

  def fetch_teacher_details
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    { age: age, name: name, specialization: specialization }
  end

  def create_teacher
    teacher_details = fetch_teacher_details
    each_teacher = Teacher.new(teacher_details[:age], teacher_details[:specialization], teacher_details[:name])
    teacher_hash = {
      'age' => each_teacher.age,
      'class' => each_teacher.class,
      'name' => each_teacher.name,
      'id' => each_teacher.id
    }
    @people << teacher_hash
    puts 'Person created successfully'
  end

  def fetch_book_details
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    { title: title, author: author }
  end

  def create_book
    book_details = fetch_book_details
    each_book = Book.new(book_details[:title], book_details[:author])
    book_hash = {
      'title' => each_book.title,
      'author' => each_book.author
    }
    @books << book_hash
    puts 'Book created successfully'
  end

  def display_books
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "#{index.to_i}) Title: \"#{book.title}\" Author: #{book.author}"
    end
  end

  def display_people
    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      puts "#{index.to_i}) Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def fetch_rental_details
    display_books
    rental_book = gets.chomp.to_i

    display_people
    rental_person = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp

    { date: date, people: @people[rental_person], books: @books[rental_book] }
  end

  def create_rental
    if @books.empty?
      puts 'Book array is empty'
    elsif @people.empty?
      puts 'Person array is empty'
    else
      rental_details = fetch_rental_details

      rental = Rental.new(rental_details[:date], rental_details[:people], rental_details[:books])

      @rentals << rental
      puts 'Rental created successfully'
    end
  end

  def list_rental_of_person
    if @rentals.empty?
      'Rental is empty'
    else
      print 'ID of person: '
      person_id = gets.chomp.to_i

      @rentals.each do |rental|
        if rental.person.id == person_id
          puts 'Rentals: '
          puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
        end
      end
    end
  end

  def save_on_exit
    puts 'Thank you for using this app!'
    new_save = Save.new
    new_save.save_file(@people, 'people.json') unless @people.empty?
    new_save.save_file(@books, 'books.json') unless @books.empty?
    # new_save.save_file(@rentals, "rentals.json") if !@rentals.empty?
  end
end
