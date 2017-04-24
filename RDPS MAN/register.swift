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
    
    //Alert Messages
    func alertMessage(userMessage:String){
        
        let Alert = UIAlertController(title:"Error", message: userMessage, preferredStyle: UIAlertControllerStyle.alert);
        let ActionOK = UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler:nil);
        
        Alert.addAction(ActionOK);
        
        self.present(Alert, animated:true, completion: nil);
        
        
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
