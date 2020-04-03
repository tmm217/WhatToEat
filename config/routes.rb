Rails.application.routes.draw do



  # Routes for the Dishagree resource:

  # CREATE
  post("/insert_dishagree", { :controller => "dishagrees", :action => "create" })
          
  # READ
  get("/dishagrees", { :controller => "dishagrees", :action => "index" })
  
  get("/dishagrees/:path_id", { :controller => "dishagrees", :action => "show" })
  
  # UPDATE
  
  post("/modify_dishagree/:path_id", { :controller => "dishagrees", :action => "update" })
  
  # DELETE
  get("/delete_dishagree/:path_id", { :controller => "dishagrees", :action => "destroy" })

  #------------------------------

  # Routes for the Cuisineagree resource:

  # CREATE
  post("/insert_cuisineagree", { :controller => "cuisineagrees", :action => "create" })
          
  # READ
  get("/cuisineagrees", { :controller => "cuisineagrees", :action => "index" })
  
  get("/cuisineagrees/:path_id", { :controller => "cuisineagrees", :action => "show" })
  
  # UPDATE
  
  post("/modify_cuisineagree/:path_id", { :controller => "cuisineagrees", :action => "update" })
  
  # DELETE
  get("/delete_cuisineagree/:path_id", { :controller => "cuisineagrees", :action => "destroy" })

  #------------------------------

  # Routes for the Dish resource:

  # CREATE
  post("/insert_dish", { :controller => "dishes", :action => "create" })
          
  # READ
  get("/dishes", { :controller => "dishes", :action => "index" })
  
  get("/dishes/:path_id", { :controller => "dishes", :action => "show" })
  
  # UPDATE
  
  post("/modify_dish/:path_id", { :controller => "dishes", :action => "update" })
  
  # DELETE
  get("/delete_dish/:path_id", { :controller => "dishes", :action => "destroy" })

  #------------------------------

  # Routes for the Cuisine resource:

  # CREATE
  post("/insert_cuisine", { :controller => "cuisines", :action => "create" })
          
  # READ
  get("/cuisines", { :controller => "cuisines", :action => "index" })
  
  get("/cuisines/:path_id", { :controller => "cuisines", :action => "show" })
  
  # UPDATE
  
  post("/modify_cuisine/:path_id", { :controller => "cuisines", :action => "update" })
  
  # DELETE
  get("/delete_cuisine/:path_id", { :controller => "cuisines", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "users", :action => "new_registration_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "users", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "users", :action => "edit_registration_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "users", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "users", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_sessions", :action => "new_session_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_sessions", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_sessions", :action => "destroy_cookies" })
             
  #------------------------------

  # ======= Add Your Routes Above These =============
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
