defmodule HelloWeb.Router do
  use HelloWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", HelloWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    get "/teams", TeamsController, :index
    post "/teams", TeamsController, :create
    #put "/teams", TeamsController, :edit
    get "/teams/:id/members", TeamsController, :members
    get "/teams/:id/add/:user_id", TeamsController, :add_user
    #get "/teams/:id/patients", TeamsController, :show

    #get "/patients", PatientController, :index
    #post "/patient", PatientController, :index #create patient
    #get "/patient/:id", PatientController, :index
    #get "/patient/:id/actions", PatientController, :index

    #put "/patient/:id/referral", PatientController, :referral
    #put "/patient/:id/transfer", PatientController, :transfer
    #put "/patient/:id/handover", PatientController, :handover
    #put "/patient/:id/discharge", PatientController, :discharge

    #get "/actions", ActionController, :index
    #post "/actions", ActionController, :create
  end

  # Other scopes may use custom stacks.
  # scope "/api", HelloWeb do
  #   pipe_through :api
  # end
end
