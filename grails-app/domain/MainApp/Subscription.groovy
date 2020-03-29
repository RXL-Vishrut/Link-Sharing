package MainApp

import enums.Seriousness

class Subscription {
    Seriousness seriousness

    Date dateCreated

    static belongsTo = [user: User, topic: Topic]
    static constraints = {
        topic blank: false
        user blank: false

    }

    static mapping = {

    }
}
