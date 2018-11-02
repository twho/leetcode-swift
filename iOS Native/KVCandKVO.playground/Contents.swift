import UIKit

class Profile: NSObject {
    @objc dynamic var name: String
    @objc dynamic var age: Int
    @objc dynamic var profile: Profile! // For KVO
    
    override init() {
        self.name = ""
        self.age = 0
        
        super.init()
    }
    
    convenience init(_ name: String, _ age: Int) {
        self.init()
        self.name = name
        self.age = age
    }
}

// Normal way
var profileNormal = Profile()
profileNormal.name = "Mike"
profileNormal.age = 26

// With KVC:
var profile = Profile()
profile.setValue("Michael", forKey: "name")
profile.setValue(26, forKey: "age")
profile.value(forKey: "name") // Michael

profile.setValue(Profile(), forKey: "profile")
profile.setValue("Amy", forKeyPath: "profile.name")
profile.setValue(28, forKeyPath: "profile.age")
profile.value(forKeyPath: "profile.name")

// KVO
class ObserverSample: NSObject {
    var profile1: Profile!
    var profile2: Profile!
    
    override init() {
        super.init()
        
        profile1 = Profile("Michael", 27)
        profile2 = Profile("Amy", 28)
        
        profile1.addObserver(self, forKeyPath: "name", options: [.new, .old], context: nil)
        profile2.addObserver(self, forKeyPath: "age", options: [.new, .old], context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        switch keyPath {
        case "name":
            print("Name old value: \(change![NSKeyValueChangeKey.oldKey]!)")
            print("Name new value: \(change![NSKeyValueChangeKey.newKey]!)")
        case "age":
            print(change!)
        default:
            break
        }
    }
    
    deinit {
        profile1.removeObserver(self, forKeyPath: "name")
        profile2.removeObserver(self, forKeyPath: "age")
    }
}

let observeExample = ObserverSample()
observeExample.profile1.name = "Mike"
observeExample.profile2.age = 27
