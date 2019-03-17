//
//  ViewController.swift
//  BBS_Client
//
//  Created by Zerbi Clément on 25/01/2019.
//  Copyright © 2019 Zerbi Clément. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    func getBoards() {
        let session = URLSession.shared // preconfigured session with "rational" defaults
        let url = URL(string: "http://localhost:8080/boards")
        if let u = url { // make sure url is not nil
            let task = session.dataTask(with: u) { data, response, error in
                if let e = error { // test if error isn't nil
                    print("Error! \(e)")
                } else if let d = data { // test if data isn't nil
                    if let s = String(data: d, encoding: .utf8) {
                        print(s)
                        DispatchQueue.main.async { // on retourne sur le thread principal quand la requete est finie
                            self.result.text = s
                        }
                    } else {
                        print(d)
                    }
                }
            }
            
            task.resume() // starts the task
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getBoards()
        // Do any additional setup after loading the view, typically from a nib
        
    }

    @IBOutlet weak var result: UILabel!
    
    @IBOutlet weak var name: UITextField!
    
    @IBAction func postName(_ sender: Any) {
        let boardName = name.text ?? "Standart Name"
        let session = URLSession.shared
        
        if let u = URL(string: "http://localhost:8080/board/\(boardName)/new") {
                var r = URLRequest(url: u)
                r.httpMethod = "POST"
                //r.addValue("application/json", forHTTPHeaderField: "Content-Type")
                let task = session.dataTask(with: r) { (data, response, error) in
                    if let e = error { // test if error isn't nil
                        print("Error! \(e.localizedDescription)")
                    } else if let d = data {
                        print(String(data:d, encoding:.utf8) ?? "no response")
                        self.getBoards()
                        DispatchQueue.main.async { // on retourne sur le thread principal quand la requete est finie
                            self.result.text = "test yolo"
                        }
                    }
                }
                task.resume()
        }
    }
}

