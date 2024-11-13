//
//  OrangeViewController.swift
//  FirstUIKitProj
//
//  Created by Bhushan Abhyankar on 11/11/2024.
//

import UIKit

class OrangeViewController: UIViewController {

    @IBOutlet weak var orangeScreenTititle: UILabel!
    var emailID:String = ""
    var password:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        orangeScreenTititle.text = "I'm on Orange Screen - emailID is \(emailID) - password is \(password)"

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
