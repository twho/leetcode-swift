import UIKit

let swizzling: (AnyClass, Selector, Selector) -> () = {
    (forClass, originalFunc, swizzledFunc) in
    guard let original = class_getInstanceMethod(forClass, originalFunc), let swizzled = class_getInstanceMethod(forClass, swizzledFunc) else { return }
    method_exchangeImplementations(original, swizzled)
}

extension UIView {
    static func classInit() {
        let originalSelector = #selector(layoutSubviews)
        let swizzledSelector = #selector(myCustomFunc)
        swizzling(self, originalSelector, swizzledSelector)
    }
    
    @objc func myCustomFunc() {
        print("Functions are swizzled")
    }
}

UIView.classInit()

let view = UIView()
view.layoutSubviews()
