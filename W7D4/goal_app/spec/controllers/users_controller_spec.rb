require 'rails_helper'

RSpec.describe UsersController, type: :controller do

    describe "GET #new" do
        it "renders the new users template" do
            get :new
            expect(response).to render_template(:new)
        end
    end

    describe "POST #create" do
        let(:user_params) do
            { user: {
                username: "cappy",
                password: "password"
                }
            }
        end
        context "with valid params" do
            it "should log in the user" do 
                post :create, params: user_params
                user = User.find_by(username: "cappy")
                expect(session[:session_token]).to eq(user.session_token)
            end
            it "redirects to the users home page" do
                post :create, params: user_params
                user = User.find_by(username: "cappy")
                expect(response).to redirect_to(users_url)
            end
        end

        context "with in invalid params" do
            it "validates the presence of password and renders the new template with errors" do
                post :create, params: { user: {
                    username: "cappy",
                    password: ""
                    }
                }
                expect(flash.now[:errors]).to be_present
                expect(response).to render_template(:new)
            end
        end
    end
end
