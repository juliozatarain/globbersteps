import UIKit

class ViewController: UITableViewController {
    let healthManager:HealthManager = HealthManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        healthManager.authorizeHealthKit { (authorized,  error) -> Void in
            if authorized {
                print("HealthKit authorization received.")
            } else {
                print("HealthKit authorization denied!")
                if error != nil {
                    print("\(error)")
                }
            }
        }
    }
}

