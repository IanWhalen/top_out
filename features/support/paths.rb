module NavigationHelpers
  # Maps a name to a path. Used by the
  #   When /^I go to (.+)$/ do |page_name|
  # step definition in web_steps.rb

  def path_to(page_name)
    case page_name

    when /^the home\s?page$/
      root_path
    when /^the list of gyms$/
      gyms_path
    when /^the gym page for (.+)$/
      gym_path(Gym.find_by_name($1))
    when /^the wall page for (.+)$/
      wall_path(Wall.find_by_name($1))
    when /^the sign up page$/
      new_user_registration_path
    when /^the sign in page$/
      new_user_session_path
    when /^the new problem page for (.+)$/
      new_wall_problem_path(Wall.find_by_name($1))

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
