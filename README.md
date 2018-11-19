# Assumptions

* Records should be retrieved from the API every time a user visits.
* Records should only be stored if they are unique (uniqueness is validated on message, user_handle and created_at). The documentation says that id references the user, and not the message, so message uniqueness should not validate on id.
* Errors happen


# Installation

* Dependencies: Rails, local instance of postgresql
* run `bundle`. (Go get a coffee while you wait for nokogiri)
* run `rake db:create`
* run `rake db:migrate`
* run `rspec` to run the full test suite
