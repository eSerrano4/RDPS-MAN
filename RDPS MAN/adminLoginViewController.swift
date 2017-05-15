//
//  adminLoginViewController.swift
//  RDPS MAN
//
//  Created by Eric on 4/24/17.
//  Copyright © 2017 Eric. All rights reserved.
//

import UIKit

class adminLoginViewController: UIViewController {

    @IBOutlet var AdminName: UITextField!

    @IBOutlet var AdminPassword: UITextField!
    

    @IBAction func LoginButtonClicked(_ sender: Any) {
        
        //performSegue(withIdentifier: "loggedIn", sender: self)
        
        /*let userEmail = userEmailTextField.text;
         let userPassword = userPasswordTextField.text;
         
         let userEmailStored = UserDefaults.standard.string(forKey: "userEmail")
         let userPasswordStored = UserDefaults.standard.string(forKey: "userPassword");
         
         
         if(userEmailStored == userEmail)
         {
         if(userPasswordStored == userPassword)
         {
         //UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
         //UserDefaults.standard.synchronize();
         
         //self.dismiss(animated: true,completion:nil);
         performSegue(withIdentifier:"loggedIn", sender: self)
         
         }
         }*/

        
        if AdminName.text == "User" && AdminPassword.text == "User"
        {
            //if AdminPassword.text == "956747"
            //{
                performSegue(withIdentifier:"adminPage", sender: self)
            //}
        }
        else{
            resetField();
            let incorrectAlert = UIAlertController(title: "Error", message: "your user name or password is incorrect.", preferredStyle: .alert)
            incorrectAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(incorrectAlert, animated: true, completion: nil)
        }
        
        
    }
    
    
    func resetField(){
        AdminName.text = ""
        AdminPassword.text = ""
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
