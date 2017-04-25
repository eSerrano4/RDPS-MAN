//
//  StaffViewController.swift
//  RDPS MAN
//
//  Created by Eric on 4/24/17.
//  Copyright © 2017 Eric. All rights reserved.
//

import UIKit

class StaffViewController: UIViewController {

    @IBOutlet weak var roomNumber: UITextField!
    @IBOutlet weak var TicketRequest: UITextView!
    
    @IBOutlet weak var userName: UITextField!
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        
        //Store to database
        let request = NSMutableURLRequest(url: NSURL (string: "http://localhost:8888/register/TicketRequest.php")! as URL)
        request.httpMethod = "POST"
        
        let postString = "a=\(String(describing: roomNumber.text!))&b=\(String(describing: TicketRequest.text!))&c=\(String(describing: userName.text!))"
        
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
        
        roomNumber.text = "";
        TicketRequest.text = "";
        
        
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logOutButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    
    }



}
