//
//  FirstTableViewController.swift
//  jsonPractice
//
//  Created by 黃毓皓 on 2017/2/25.
//  Copyright © 2017年 ice elson. All rights reserved.
//

import UIKit

class FirstTableViewController: UITableViewController {

    
   
    
    
    var resultsArray:[[String:String]]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getJson()
    }
    
    func getJson() {
        
        
        let url = URL(string: "http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=f4a75ba9-7721-4363-884d-c3820b0b917c")
        let request = URLRequest(url: url!)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if error != nil{
                print(error?.localizedDescription)
                return
            }
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String:AnyObject]
                
                let result = json["result"] as! [String:AnyObject]
                
                let results = result["results"] as! [[String:String]]
                
                self.resultsArray = results
                
               
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                    
                
                
//                for show in results {
//                    print(show)
//                }
 
                
            } catch  {
                print(error.localizedDescription)
            }

            
        }
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! myTableViewCell
        
    
            cell.myLabel.text = resultsArray?[indexPath.row]["Name"]
        
       let imageUrl =  resultsArray?[indexPath.row]["ImageName"]
        let url = URL(string: imageUrl!)
        
        let urlRequest  = URLRequest(url: url!, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 30)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            if let data = data{
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    cell.myImageview.image = image
                }
                
            }
        }
        task.resume()
        return cell 
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return resultsArray?.count ?? 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
