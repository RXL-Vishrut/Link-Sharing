abstract class Resource {

    String description
    User createdBy

    Date dateCreated
    Date lastUpdated

    static belongsTo = [topic:Topic]
    static hasMany = [readingItems : ReadingItem, resourceRatings: ResourceRating]

    static mapping={
        table "Resources"
        //tablePerHierarchy  false
    }

}



