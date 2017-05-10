
import UIKit

@IBDesignable
class UIviewX: UIView {
    @IBInspectable var roundCorner: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = roundCorner
        }
    }
}
