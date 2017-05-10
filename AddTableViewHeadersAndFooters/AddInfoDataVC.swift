
import UIKit

class AddInfoDataVC: UIViewController {
    
    var saveHumanData: ((Human) -> ())?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    
    @IBOutlet weak var mainBGView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        mainBGView.layer.cornerRadius = 10
        mainBGView.clipsToBounds = true
    }
    
    @IBAction func saveDataBarButtonItem(_ sender: UIBarButtonItem) {
        
        if var name = nameTextField.text, var surname = surnameTextField.text, let age = Int(ageTextField.text!) {
            name = name.capitalized
            surname = surname.capitalized
            
            let totalHumanData = Human(name: name, surname: surname, age: age)
            
            if let save = saveHumanData {
                save(totalHumanData)
                navigationController?.popViewController(animated: true)
            }
        }
    }
}
