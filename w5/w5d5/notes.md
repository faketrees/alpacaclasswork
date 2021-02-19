find != find_by 
find is loud with the errors
find_by is not


active record generates sql querries

where 
where.not

User.where(email: "foo@bar.com")
User.where("email = 'foo@bar.com'") -most vulnerable to sql injection because it passes the whole string

User.where("email = (?)", "foo@bar.com)
User.where("email = :youremail", yourmail: "foo@bar.com")



more active record methods - these all are basically their SQL equivalents
    group()
    having()
    order()
    offset()
    limit()

calculations/aggregations
    count()
    sum()
    minimum()
    maximum()
    average()



Joins will only have access to the joined table (primary table AKA table you called it on) by default

to get around that
User.joins(:post).select('*')

Pluck
    will trigger an immediate query!
    accepts column name as an argument
    returns an array
    should be at the end
    because it returns an array it cannot be chained with further scopes


active record translates nil into null



            .attributes will show what the query has access to

.pluck returns an array but not the objects
    can't call custom methods


n+1 querries
    -  when you execute a query and then try to run querries for each memeber of the collection
        - posts = user1.posts
        res = {}
        posts.each do |post| #this is the n + 1 query
            res[post] = post.length
        end
    you make 1 query for user.posts for each post you make n querries o find the comment length for each post this is a N + 1 query

includes and ager loading for n +1 querries
    includes takes association names as parameters
    allows us to chain our querries and pre-fetch associations
        generates a 2nd query to prefetch data
    Eager loading is pre-fetching

Joins creates a single query


saving it to a variable is like precaching a query