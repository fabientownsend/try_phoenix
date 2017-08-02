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
    get "/teams/:id", TeamsController, :show # id could be name
    #get "/teams/:id/members", TeamsController, :show
    #get "/teams/:id/patients", TeamsController, :show
    #put "/teams", TeamsController, :create #pop up

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
