//
//  register.swift
//  RDPS MAN
//
//  Created by Eric on 4/23/17.
//  Copyright © 2017 Eric. All rights reserved.
//

import UIKit

class register: UIViewController {
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    let defaults = UserDefaults.standard
    var registeredUsers = [String]()
    var passwordArr = [String]()
    
    
    
    
    
    
    
    //Alert Messages
    func alertMessage(userMessage:String){
        
        let Alert = UIAlertController(title:"Error", message: userMessage, preferredStyle: UIAlertControllerStyle.alert);
        let ActionOK = UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler:nil);
        
        Alert.addAction(ActionOK);
        
        self.present(Alert, animated:true, completion: nil);
        
        
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        
        if defaults.object(forKey: "usernames") != nil{
            registeredUsers = defaults.array(forKey: "usernames") as! [String]
            passwordArr = defaults.array(forKey: "passwords") as! [String]
        }
        
        //create a new account 
        registeredUsers.insert(userEmailTextField.text!, at: registeredUsers.count)
        passwordArr.insert(userPasswordTextField.text!, at: passwordArr.count)
        defaults.set(registeredUsers, forKey: "usernames")
        defaults.set(passwordArr, forKey: "passwords")
        dismiss(animated:true, completion:nil)
    
        let userEmail = userEmailTextField.text;
        let userPassword = userPasswordTextField.text;
        let userRepeatPassword = repeatPasswordTextField.text;
        
        //check for empty text fields
        if ((userEmail?.isEmpty)! || (userPassword?.isEmpty)! || (userRepeatPassword?.isEmpty)!)
        {
            alertMessage(userMessage: "all fields are required");
            return;
        }
        if ( userPassword != userRepeatPassword)
        {
            alertMessage(userMessage: "Passwords dont match")
            return;
        }
        
        //Store user Data to app memory
        //UserDefaults.standard.set(userEmail, forKey: "userEmail");
        //UserDefaults.standard.set(userPassword, forKey: "userPassword");
        //UserDefaults.standard.synchronize();
        
        //Store to database
        let request = NSMutableURLRequest(url: NSURL (string: "http://localhost:8888/register/storeValues.php")! as URL)
        request.httpMethod = "POST"
        
        let postString = "a=\(String(describing: userEmailTextField.text!))&b=\(String(describing: userPasswordTextField.text!))"
        
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest){
            data, response, error in
            
            if error != nil {
                print("error=\(String(describing: error))")
                return
            }
            print("response = \(String(describing: response))")
            
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print("responseString =\(String(describing: responseString))")
            
        }
        task.resume()
        
        
        
        //pop-Up
        let alertController = UIAlertController(title: "Candidate", message: "Successfully Added", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title:"ok", style: UIAlertActionStyle.default, handler: nil))
        
        self.present(alertController, animated:true, completion:nil)
        
        userEmailTextField.text = "";
        userPasswordTextField.text = "";

    
    
    
    
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
