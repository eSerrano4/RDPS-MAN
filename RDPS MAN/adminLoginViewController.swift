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
        
        //let admin = "Serrano";
        //let adminP = "956747";
        
        if AdminName.text == "Serrano"
        {
            if AdminPassword.text == "956747"
            {
                performSegue(withIdentifier:"adminPage", sender: self)
            }
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
