import enums.Visibility

class Topic {
    String name
    User createdBy
    Visibility visibility

    Date dateCreated
    Date lastUpdated

    static hasMany=[subscriptions:Subscription , resources: Resource]

    static constraints = {

    }

    static mapping = {

    }
}
