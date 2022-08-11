# Client Server Communication
## SWBATs:
- [ ] Observe fetching from client to show route and displaying a show page
- [ ] Observe sending a PATCH request from React client
- [ ] Observe sending a DELETE request from React client
- [ ] Observe how to handle exceptions in controller actions
- [ ] Review strong params
- [ ] Review Active Record validations
- [ ] Review error handling


### Review

What is the expected behavior if the method .find is being passed a record ID that does not exist? 
- will raise an exception: ActiveRecord::RecordNotFound, solve it with a rescue statement

- .find_by: will return nil or break our program. find_by_username* 


What happens if we try to use mass assignment by doing: `Production.create(params)`?
- Forbidden error. Can't do mass assignment using `params` in a Rails app
- we need to permit our attributes using strong params `params.permit(...attr)`

When are strong params necessary and what is the benefit of using them?
- adds security to the type of data coming into our app

Why are strong params defined as private methods?
- restrict access to the controller. only avialable within the class that its been defined for

What types of methods will invoke validations set on a model?
create
create!
save
save!
update
update!
validate?

What feedback in our console can we look for to determine if validations fail and object persistence does not occur?
- SQL query: rollback transaction
- missing ID 

If a validation does fail, what method(s) can be used to read the types of failures that occurred?
- `.errors`
- `.errors.full_messages`

`record.errors.full_messages`



Images:
landingPageImage
https://unsplash.com/photos/POd35V_uE4k
Published on February 16, 2018
Free to use under the Unsplash License
Dancer: Olivia Tarchick