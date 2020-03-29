package MainApp

class ResourceRating {
    Integer score

    Date dateCreated


    static belongsTo = [user: User, resource: Resource]
}
