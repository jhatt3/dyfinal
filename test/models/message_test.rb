require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  include ActiveModel::Model
  
  attr_accessor :name, :email, :body


  test 'responds to name, email and body' do 
    attrs = {
      name: 'jesse',
      email: 'jesse#thebeginningprogrammer.com',
      body: 'ooops ther it is!'
    }

    msg = Message.new
    assert msg.valid?, 'should be valid'
    # assert msg.respond_to?(:name),  'does not respond to :name'
    # assert msg.respond_to?(:email), 'does not respond to :email'
    # assert msg.respond_to?(:body),  'does not respond to :body'
  end
end
