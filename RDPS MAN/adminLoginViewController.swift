//
//  adminLoginViewController.swift
//  RDPS MAN
//
//  Created by Eric on 4/24/17.
//  Copyright © 2017 Eric. All rights reserved.
//

import UIKit

class adminLoginViewController: UIViewController {

    @IBOutlet weak var adminUserName: UITextField!
    @IBOutlet weak var adminPassword: UITextField!
    
    
    @IBAction func adminLoginButtonPressed(_ sender: AnyObject) {
        let admin = "Serrano";
        let adminP = "956747";
        
    if adminUserName.text == admin && adminPassword.text == adminP
    {
        performSegue(withIdentifier:"adminPage", sender: self)
        
    }
    
    
    
    
    
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
