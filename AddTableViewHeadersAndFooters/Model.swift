
import UIKit

class Model {
    
    let name: String
    let summary: String
    let category: String
    let image: String
    let artist: String
    let id: String
    
    init(name: String, summary: String, category: String, image: String, artist: String, id: String) {
        self.name = name
        self.summary = summary
        self.category = category
        self.image = image
        self.artist = artist
        self.id = id
    }
}

class Human {
    
    var name: String
    var surname: String
    var age: Int
    
    init(name: String, surname: String, age: Int) {
        self.name = name
        self.surname = surname
        self.age = age
    }
    
    convenience init(name: String) {
        self.init(name: name, surname: "", age: 0)
    }
}
