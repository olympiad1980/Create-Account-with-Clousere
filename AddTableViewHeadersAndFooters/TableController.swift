//        modelArray = [
//            Human(name: "Ihor", surname: "Pavlov", age: 37),
//            Human(name: "Maryna", surname: "Brinzak", age: 33),
//            Human(name: "Sergey", surname: "Rozyumiak", age: 36),
//            Human(name: "Maryna", surname: "Postoliuk", age: 28)
//        ]

import UIKit

class TableController: UIViewController {
    
    static let cellIdentifier = "tableCell"
    static let segueDetailIdentifier = "toDetailVC"
    static let segueAddIdentifier = "toAddInfoDataVC"
    
    
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var dataLabel: UILabel!
    
    var modelArray: [Human]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataLabel.text = "personal data"
        myTableView.separatorStyle = .none
        
        modelArray = [ Human(name: "Ihor", surname: "Pavlov", age: 37)]

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let indexPathRow = modelArray?[indexPath.row] {
            performSegue(withIdentifier: TableController.segueDetailIdentifier, sender: indexPathRow)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == TableController.segueDetailIdentifier {
            if let indexPathRow = myTableView.indexPathForSelectedRow {
                if let nextVC = segue.destination as? DetailVC, let model = modelArray {
                    // передача данных из tableView на следующтй VC
                    nextVC.detailModel = model[indexPathRow.row]
                }
            }
        }
            
        else if segue.identifier == TableController.segueAddIdentifier {
            if let nextVC = segue.destination as? AddInfoDataVC {
                nextVC.saveHumanData = { totalHumanData in
                    self.modelArray!.append(totalHumanData)
                    self.myTableView.reloadData()
                }
            }
        }
    }
}

extension TableController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let model = modelArray else {
            return 0
        }
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableController.cellIdentifier, for: indexPath)
        
        if let model = modelArray {
            cell.textLabel?.text = model[indexPath.row].name
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}



