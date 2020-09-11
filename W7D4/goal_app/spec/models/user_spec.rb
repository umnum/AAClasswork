require 'rails_helper'

RSpec.describe User, type: :model do 
  subject(:porkchop) { User.create(username:'porkchop', password: 'password')}
  #validations 
  # username, password digest, session token.  password length 
  it {should validate_presence_of(:username)}
  it {should validate_presence_of(:password_digest)}
  it {should validate_presence_of(:session_token)}
  it {should validate_length_of(:password).is_at_least(6)}
  it {should validate_uniqueness_of(:username)}
  it {should validate_uniqueness_of(:session_token)}
  
  #associations


  #class scope methods  i.e User.find_by_credentials
  describe "password encryption" do
    it "does not save passwords to the database" do
        FactoryBot.create(:user, username: "Harry Potter")
        # overwrote FB's username to be what we wanted
        user = User.find_by(username: "Harry Potter")
        expect(user.password).not_to eq("password")
    end
    # testing database will roll back between it blocks i.e. stuff added to test
    # db in an it block will not persist to the next it block

    it "encrypts password using BCrypt" do
        expect(BCrypt::Password).to receive(:create).with("abcdef")
        FactoryBot.build(:user, password: "abcdef")
    end
    # FB build will only create the object but NOT save it
    # create will save it to the test db
  end

  describe "find by credentials" do
    it 'grabs user based on username and if password is correct' do
      porkchop = User.create(username:'porkchop', password: 'password')
      user = User.find_by_credentials('porkchop','password')
      # debugger
      expect(user).to eq(porkchop)
    end
  end

end
