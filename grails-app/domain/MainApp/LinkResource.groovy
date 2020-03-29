package MainApp

class LinkResource{
    String url
    String description
    static belongsTo = [resource:Resource]
}
