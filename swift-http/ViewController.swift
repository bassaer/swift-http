//
//  ViewController.swift
//  swift-http
//
//  Created by 中山翼 on 2018/10/06.
//  Copyright © 2018年 Tsubasa Nakayama. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //let src = ["AAA", "BBB", "CCC"]
    let jsonSrc = """
    {"items": ["AAA", "BBB", "CCC", "DDD"]}
    """
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
        
        let json = try? JSONSerialization.jsonObject(with: jsonSrc.data(using: .utf8)!, options: [])
        if let dictionary = json as? [String: Any] {
            if let items = dictionary["items"] as? [String] {
                cell.textLabel!.text = items[indexPath.row]
            }
        }
        
        return cell
    }
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

