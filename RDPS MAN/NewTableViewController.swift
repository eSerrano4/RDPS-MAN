//
//  NewTableViewController.swift
//  RDPS MAN
//
//  Created by Eric on 4/26/17.
//  Copyright © 2017 Eric. All rights reserved.
//
import Foundation
import UIKit

class NewTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet var tableView: UITableView!
    
    //@IBOutlet var LabelA: UILabel!
    //@IBOutlet var LabelB: UILabel!
    
    
    var values : [String] = []
    var issues : [String] = []
    var roomNumbers : [String] = []

    let list = ["one","two"]
    
    //create array
    
    
    
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return(values.count)
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("you seleced " + values[indexPath.row])
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
     
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        
        cell.name.text = values[indexPath.row]
        cell.ticketRequest.text = issues[indexPath.row]
        cell.roomNumber.text = roomNumbers[indexPath.row]
        
        /*if !(cell != nil ){
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = self.values[indexPath.row]
        //cell?.textLabel?.text = self.issues[indexPath.row]*/
        
        return cell
    
    
    }
    
    public func tableView(_tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        if(editingStyle == UITableViewCellEditingStyle.delete){
            
            values.remove(at: indexPath.row)
            tableView.reloadData()
            //tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    


    
    
    func get(){
        /*let url = NSURL(string: "http://localhost:8888/register/signIn.php")
        let data = NSData(contentsOf: url! as URL)
        values = try! JSONSerialization.jsonObject(with: data! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
        tableView.reloadData()*/
        
        
        /*let url = URL(string: "http://localhost:8888/register/signIn.php")
        let task = URLSession.shared.dataTask(with: url!){ (data, response, error) in
            if error != nil
            {
                print ("error")
                
            }
            else
            {
                if let content = data
                {
                    do{
                        // ARRAY
                        let myJSON = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        print(myJSON)
                    }
                    catch
                    {
                        
                    }
                }
            }
            
        }
        task.resume()*/

        
        //Third Trial
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        get()
        tableView.dataSource = self
        tableView.delegate = self
        
     let url = URL(string: "http://localhost:8888/register/signIn.php")
        do{
            let allData = try Data(contentsOf: url!)
            let allUserData = try JSONSerialization.jsonObject(with: allData, options: JSONSerialization.ReadingOptions.allowFragments) as! [String : AnyObject]
            if let arrJSON = allUserData["ticketRequest"]{
                for index in 0...arrJSON.count-1{
                    let aObject = arrJSON[index] as! [String : AnyObject]
                    let bObject = arrJSON[index] as! [String : AnyObject]
                    let cObject = arrJSON[index] as! [String : AnyObject]
                    
                    values.append(aObject["userName"] as! String)
                    issues.append(bObject["ticketRequest"] as! String)
                    roomNumbers.append(cObject["roomNumber"] as! String)
                }
            }
            print(values)
            print(issues)
            
            self.tableView.reloadData()
        }
        catch{
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logout(_ sender: Any) {
    dismiss(animated: true, completion: nil)
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
