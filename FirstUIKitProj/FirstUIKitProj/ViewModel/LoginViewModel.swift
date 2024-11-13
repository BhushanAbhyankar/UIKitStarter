//
//  LoginViewModel.swift
//  FirstUIKitProj
//
//  Created by Bhushan Abhyankar on 13/11/2024.
//

import Foundation


class LoginViewModel{
    
    func isCredentialsValid(emailID:String, password:String) -> Bool{        
        guard !emailID.isEmpty && !password.isEmpty else{
            return false
        }
        let isPasswordValid = password.count >= 6
        //abc@gmail.com
        
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        let isEmailIDValid = emailPredicate.evaluate(with: emailID)
        
        return isPasswordValid && isEmailIDValid
    }
}
