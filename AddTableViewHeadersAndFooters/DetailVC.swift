
import UIKit

class DetailVC: UIViewController {

    var detailModel: Human?
    
    private let backImage = UIImage(named: "Back_000000_100")
    private let inImage = UIImage(named: "In_000000_100")
    private let stubImage = UIImage(named: "stubImage")
    
    var menuShowing = true
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!

    @IBOutlet weak var plashkaRose: UIView!
    @IBOutlet weak var movieConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieConstraint.constant = view.bounds.size.height - plashkaRose.frame.size.height
        photoImageView.image = stubImage
        photoImageView.clipsToBounds = true
        
        if let detail = detailModel {
            nameLabel.text = detail.name
            surnameLabel.text = detail.surname
            ageLabel.text = "age is: \(detail.age)"
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        view.addSubview(initPushButton())
    }
    
    // функция инициализирует Action Button
    func initPushButton() -> UIButton {
        let sizeButton: CGFloat = 30
        let costomSizePage = view.bounds.size.height - plashkaRose.frame.size.height
        let button = UIButton()
        button.frame = CGRect(x: sizeButton, y: costomSizePage + sizeButton, width: sizeButton, height: sizeButton)
        button.setImage(backImage, for: .normal)
        button.contentMode = .scaleAspectFill
        button.addTarget(self, action: #selector(showAndHiddingMenu), for: .touchUpInside)
        
        return button
    }
    
    // функция возвращает на предыдущий экран
    func backToVC(sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
        
        if sender.currentImage == backImage {
            sender.setImage(inImage, for: .normal)
            sender.tintColor = UIColor.red
        }
        
        else {
            sender.setImage(backImage, for: .normal)
        }
    }
    
    // функция убирает plashkaRose из зоны видимости
    func showAndHiddingMenu() {
        let mainSizeHeight = plashkaRose.frame.size.height
        
        if menuShowing {
            movieConstraint.constant = view.frame.maxY + mainSizeHeight
        }
        else {
            movieConstraint.constant = view.bounds.size.height - plashkaRose.frame.size.height
        }
        
        UIView.animate(withDuration: 0.7) {
            self.view.layoutIfNeeded()
        }
        menuShowing = !menuShowing
    }
}



