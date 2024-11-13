//
//  ViewController.swift
//  FirstUIKitProj
//
//  Created by Bhushan Abhyankar on 07/11/2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var emailIDTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    var viewModel = LoginViewModel()
    
//    override func loadView() {
//        <#code#>
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        titleLabel.text = "Login Screen"
        titleLabel.textColor = .brown
        loginButton.setTitle("SignUP", for: .normal)
        print("1. viewDidLoadz")
    }
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        print("2. viewWillAppear This method gets called just before view controllers view is about to be added into view hirearchy")
//    }
//    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        print("3. viewDidAppear This method gets called  view controllers view is  added into view hirearchy")
//
//    }
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        print("4. viewWillDisappear This method gets called  view controllers viewis about to be removed from view hirearchy")
//    }
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//        print("5. viewDidDisappear This method gets called  view controllers view is removed from view hirearchy")
//
//    }
//    deinit{
//        print("6. deinit")
//    }
//    
    
    
    @IBAction func loginButtonClicked(_ sender: Any) {
    
        if viewModel.isCredentialsValid(emailID: emailIDTextField.text ?? "", password: passwordTextField.text ?? ""){
            print("Credentials are Valid")
            let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let listViewController:ListViewController = storyboard.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
            self.navigationController?.pushViewController(listViewController, animated: true)
        }else{
            print("InValid")
            let alert = UIAlertController(title: "Oops! Something Went Wrong", message: "Entered Credentails are not Valid.Please try again", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            alert.addAction(UIAlertAction(title: "Update", style: .default, handler: { alertAct in
                print("Update action")
                
            }))
            self.present(alert, animated: true)
        }

    }
    
    
    @IBAction func secondButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "SecondScreenID", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "SecondScreenID"{
            if let destination = segue.destination as? OrangeViewController{
                let emailText = emailIDTextField.text ?? ""
                let passwordText = passwordTextField.text ?? ""
                
                destination.emailID = emailText
                destination.password = passwordText
            }
        }
    }
    @IBAction func showListScreen(_ sender: Any) {
        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let listViewController:ListViewController = storyboard.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
        self.navigationController?.pushViewController(listViewController, animated: true)
        
    }
    
    
    @IBAction func showGridScreen(_ sender: Any) {
        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let gridViewController:MyCollectionViewController = storyboard.instantiateViewController(withIdentifier: "MyCollectionViewControllerID") as! MyCollectionViewController
        self.navigationController?.pushViewController(gridViewController, animated: true)
    }
    
    @IBAction func goingToNewVC(_ sender: Any) {
        
        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newVC = storyboard.instantiateViewController(withIdentifier: "TabBarID")
        self.navigationController?.pushViewController(newVC, animated: true)
    }
    
    @IBAction func navigateToSecondStoryboard(_ sender: Any) {
        
        let storyboard:UIStoryboard = UIStoryboard(name: "AccountsStoryboard", bundle: nil)
        let newVC = storyboard.instantiateViewController(withIdentifier: "SecondVCID")
        self.navigationController?.pushViewController(newVC, animated: true)
    }
    
}

