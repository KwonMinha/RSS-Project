//
//  ViewController.swift
//  RSSTest
//
//  Created by 권민하 on 2020/03/26.
//  Copyright © 2020 권민하. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var RSSTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

extension ViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RSSTableViewCell", for: indexPath) as! RSSTableViewCell
                
        
        return cell
    }
    
    
}

