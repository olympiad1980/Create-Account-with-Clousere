
import UIKit

class TinderLikeSwipe: UIViewController {

    @IBOutlet weak var imageView: UIviewX!
    @IBOutlet weak var card: UIviewX!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.addSubview(itinImageInView())
    }
    
    func itinImageInView() -> UIImageView {
        let picters = UIImageView()
        let widthPosition = imageView.bounds.size.width
        let heightPosition = imageView.bounds.size.height
        picters.frame = CGRect(x: -50, y: 0, width: widthPosition + 100, height: heightPosition + 100)
        picters.image = UIImage(named: "stubImage")
        picters.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        view.addSubview(picters)
        
        return picters
    }
    
    @IBAction func tapPanCard(_ sender: UIPanGestureRecognizer) {
        moveToCard(pan: sender)
    }
    
    func moveToCard(pan: UIPanGestureRecognizer) {
        let card = pan.view
        let point = pan.translation(in: view)
        let xFormCentre = (card?.center.x)! - view.center.x
        card?.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
        
        if xFormCentre > 0 {
            imageView.alpha = 0.3
        }
        else {
            imageView.alpha = 1
        }
        
        if pan.state == UIGestureRecognizerState.ended {
            
            UIView.animate(withDuration: 0.7) {
                card?.center = self.view.center
            }
        }
    }
}
