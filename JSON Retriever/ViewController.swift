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
        
        
        
        let string = "http://mirthfhir.ddns.net/dstu2/patient"
        //let string = "http://api.fixer.io/latest" // Dont include any HTTP headers
        let url = NSURL(string: string)
        let request = NSMutableURLRequest(url: url! as URL)
        request.httpMethod = "GET"
        
        //request.addValue("application/json+fhir", forHTTPHeaderField: "Content-Type")
        
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

