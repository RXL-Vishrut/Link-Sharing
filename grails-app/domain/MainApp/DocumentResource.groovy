package MainApp

class DocumentResource {
    String filePath
    String description
    static belongsTo = [resource:Resource]
}
