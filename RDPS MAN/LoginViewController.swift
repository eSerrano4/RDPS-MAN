//
//  LoginViewController.swift
//  RDPS MAN
//
//  Created by Eric on 4/24/17.
//  Copyright © 2017 Eric. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    var registeredUsers = [String]()
    var passwordArr = [String]()

    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func resetField(){
        userEmailTextField.text = ""
        userPasswordTextField.text = ""
    }
    
    //Alert Messages
    func alertMessage(userMessage:String){
        
        let Alert = UIAlertController(title:"Error", message: userMessage, preferredStyle: UIAlertControllerStyle.alert);
        let ActionOK = UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler:nil);
        
        Alert.addAction(ActionOK);
        
        self.present(Alert, animated:true, completion: nil);
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        
        
        
        
    
        if defaults.object(forKey: "usernames") != nil{
            registeredUsers = defaults.object(forKey: "usernames") as! [String]
            passwordArr = defaults.object(forKey: "passwords") as! [String]
            for x in 0...(registeredUsers.count - 1){
            if (userEmailTextField.text! == registeredUsers[x]) && (userPasswordTextField.text! == passwordArr[x]){
                performSegue(withIdentifier: "loggedIn", sender: self)
                break
            }
        }
            resetField();
            let incorrectAlert = UIAlertController(title: "Error", message: "your user name or password is incorrect.", preferredStyle: .alert)
            incorrectAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(incorrectAlert, animated: true, completion: nil)
    }
        
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
        
        


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


}
}
