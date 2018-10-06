//
//  ViewController.swift
//  swift-http
//
//  Created by 中山翼 on 2018/10/06.
//  Copyright © 2018年 Tsubasa Nakayama. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
     @IBOutlet weak var tableView: UITableView!
    var jsonArray: [String] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jsonArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
        cell.textLabel!.text = jsonArray[indexPath.row]
        return cell
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let src = """
        {"items": ["AAA", "BBB", "CCC", "DDD", "EEE"]}
        """
        let json = try? JSONSerialization.jsonObject(with: src.data(using: .utf8)!, options: [])
        print(json!)
        if let dictionary = json as? [String: Any] {
            if let json = dictionary["items"] as? [String] {
                jsonArray = json
            }
        }
    }
}

