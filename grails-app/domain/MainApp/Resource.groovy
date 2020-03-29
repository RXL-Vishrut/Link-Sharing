package MainApp

class Resource {

    String description
    User createdBy

    Date dateCreated
    Date lastUpdated

    static belongsTo = [topic:Topic]
    static hasMany = [readingItems: ReadingItem, resourceRatings: ResourceRating ,linkResource:LinkResource,documentResource:DocumentResource]

    static constraints = {
        description blank: false
    }
    static mapping={
        table "Resources"
       // table perHierarchy: false
    }

}



