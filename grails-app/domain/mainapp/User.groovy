package mainapp

class User {

    String email
    String userName
    String password
    String firstName
    String lastName
    String confirmPassword
    byte[] photo
    Boolean admin
    Boolean active
    Date dateCreated
    Date lastUpdated


    static hasMany = [topics: Topic, subscriptions: Subscription, resources: Resource, readingItems: ReadingItem, resourceRatings: ResourceRating]

    static constraints = {
        email email: true
        email unique: true
        userName blank: false
        userName unique: true
        firstName blank: false
        email blank: false
        password blank: false
        lastName blank: false
        photo nullable: true
        confirmPassword nullable: true


    }
    static mapping = {
        table "Users"
    }

}
