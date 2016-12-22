//
//  ViewController.swift
//  jsonapp
//
//  Created by Dustin Quillen on 12/22/16.
//  Copyright © 2016 Dustin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        runStuff()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func runStuff()
    {
        let address = "http://mirthfhir.ddns.net/dstu2/patient"
        //let address = "http://api.fixer.io/latest"
        let url = NSURL(string: address)
        let request = NSMutableURLRequest(url: url! as URL)
        request.httpMethod = "GET"
        
        // Put your HTTP request headers here:
        request.addValue("application/json+fhir", forHTTPHeaderField: "Content-Type")
        
        
        let session = URLSession.shared
        
        let myTask = session.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
            
            if let content = data
            {
                do
                {
                    let myJson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                    
                    print(myJson)

                }
                catch
                {
                    
                }
            }
        }
        myTask.resume()
    }
}
