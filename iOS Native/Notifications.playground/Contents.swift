import UIKit

class NotificationExample: NSObject {
    
    override init() {
        super.init()
        
        NotificationCenter.default.addObserver(self, selector: #selector(observedValue(_:)), name: Notification.Name.sampleNotification, object: nil)
    }
    
    @objc func observedValue(_ notification: Notification) {
        print("Value is observed. Data received: \(notification.userInfo ?? [:])")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: Notification.Name.sampleNotification, object: nil)
    }
}

extension Notification.Name {
    public static let sampleNotification = Notification.Name("sampleNotification")
}

let example = NotificationExample()
NotificationCenter.default.post(name: Notification.Name.sampleNotification, object: nil, userInfo: ["Ho":"Michael"])
