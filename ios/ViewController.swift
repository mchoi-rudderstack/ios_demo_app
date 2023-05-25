import UIKit
import OTPublishersHeadlessSDK
import Rudder

class ViewController: UIViewController {
    
    @IBOutlet var EventName: UITextField!
    @IBOutlet var UserId: UITextField!
    @IBOutlet var Eprop1: UITextField!
    @IBOutlet var Eprop2: UITextField!
    @IBOutlet var Eval1: UITextField!
    @IBOutlet var Eval2: UITextField!
    @IBOutlet var Trait1: UITextField!
    @IBOutlet var Trait2: UITextField!
    @IBOutlet var Traitval1: UITextField!
    @IBOutlet var Traitval2: UITextField!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onConsent(_ sender: Any) {
        OTPublishersHeadlessSDK.shared.setupUI(self, UIType: .banner)
    }
    
    @IBAction func onIdentify(_ sender: Any) {
        var Traits = [String: String]()
        
        if (Trait1.text != "") {
            Traits[Trait1.text!] = Traitval1.text!
        }
        if (Trait2.text != "") {
            Traits[Trait2.text!] = Traitval2.text!
        }

        RSClient.sharedInstance()?.identify(UserId.text!, traits: Traits)
    }
    
    @IBAction func onTrack(_ sender: Any) {
        var Properties = [String: String]()
        
        if (Eprop1.text != "") {
            Properties[Eprop1.text!] = Eval1.text!
        }
        if (Eprop2.text != "") {
            Properties[Eprop2.text!] = Eval2.text!
        }
        
        RSClient.sharedInstance()?.track(EventName.text!, properties: Properties)
    }
    
    @IBAction func onReset(_ sender: Any) {
        RSClient.sharedInstance()?.reset()
    }
    
}

