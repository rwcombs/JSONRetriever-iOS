//
//  ViewController.swift
//  JSON Retriever
//
//  Created by Wesley Combs on 12/22/16.
//  Copyright © 2016 Wesley Combs. All rights reserved.
//
//  Built using the tutorial by Sebastian Henry aka The Swift Guy
//  https://www.youtube.com/watch?v=-ddIP7NRkmY

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
    
        // Getting Data
        let url = URL(string:"http://api.fixer.io/latest")
        //let url = URL(string: "http://mirthfhir.ddns.net/dstu2/Patient/10")
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if error != nil
            {
                print("ERROR")
            }
            else
            {
                if let content = data
                {
                    do
                    {
                        let myJson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        
                        print (myJson)
                    }
                    catch
                    {
                    
                    }
                }
            }
        }
        task.resume()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

