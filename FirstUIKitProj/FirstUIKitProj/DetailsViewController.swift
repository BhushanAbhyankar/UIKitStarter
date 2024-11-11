//
//  DetailsViewController.swift
//  FirstUIKitProj
//
//  Created by Bhushan Abhyankar on 08/11/2024.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var detailLabel: UILabel!
   
    var receivedData:String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        detailLabel.text = "I'm Details Screen and Had receivedData = \(receivedData)"
        
        
    }
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    deinit{
        print("6. deinit")
    }
}
