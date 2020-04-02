package mainapp

class ReadingItem {
    Boolean isRead

    Date dateCreated
    Date lastUpdated

    static belongsTo = [user:User, resource: Resource]
    static constraints = {

    }
    static mapping = {

    }
}
