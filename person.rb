# frozen_string_literal: true

#
# Class Person
# Demo using Hash in the initializer and an experiment using yield(block)
#
class Person
  attr_accessor :firstname, :lastname, :title

  def initialize(options={})
    @firstname = options[:firstname] || 'John'
    @lastname = options[:lastname] || 'Doe'
    @title = options[:title] || ''
  end

  def say_hello
    'Hello!'
  end

  def full_name
    "#{yield(:title) + ' ' if block_given?}#{firstname} #{lastname}"
  end

  def initial_and_last_name
    "#{get_initial(firstname)} #{lastname}"
  end

  private

  def get_initial(name)
    name.chars.first + '.'
  end
end

person = Person.new(
  firstname: 'Andri',
  lastname: 'Gunawan',
  title: 'Mr.'
)
puts person.initial_and_last_name
puts(person.full_name { 'Mr.' })
puts person.full_name
puts person.title
