//
//  ViewController.swift
//  RSSTest
//
//  Created by 권민하 on 2020/03/26.
//  Copyright © 2020 권민하. All rights reserved.
//

import UIKit
import Kanna

class ViewController: UIViewController {
    @IBOutlet weak var RSSTableView: UITableView!
    
    private var rssItems: [RSSItem]?
    //private var cellStates: [CellState]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        RSSTableView.delegate = self
        RSSTableView.dataSource = self
        
        //RSSTableView.estimatedRowHeight = 155.0
        //RSSTableView.rowHeight = UITableView.automaticDimension
        
        fetchData()
        //parseHTML()
    }
    
    //    func parseHTML() {
    //        let url = URL(string: "https://en.wikipedia.org/wiki/Cat")
    //        if let doc = HTML(url: url!, encoding: .utf8) {
    //        }
    //    }
    
    private func fetchData()
    {
        let feedParser = FeedParser()
        feedParser.parseFeed(url: "https://news.google.com/rss?hl=ko&gl=KR&ceid=KR:ko") { (rssItems) in
            self.rssItems = rssItems
            //self.cellStates = Array(repeating: .collapsed, count: rssItems.count)
            
            OperationQueue.main.addOperation {
                //self.RSSTableView.reloadSections(IndexSet(integer: 0), with: .left)
                self.RSSTableView.reloadData()
            }
        }
    }
    
    func getContentFromHtml(urlString : String) -> String{
        let url = URL(string: urlString)!
        
        var result = ""
        
        do {
            let doc = try HTML(url: url, encoding: .utf8)
            for description in doc.xpath("//meta[@property=\"og:description\"]") {
                if let contentDescription = description["content"] {
                    result = contentDescription
                    
                }
            }
        } catch let error {
            print(error.localizedDescription)
        }
        print(result)
        return result
    }
    
}

extension ViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let rssItems = rssItems else {
            return 0
        }
        
        // rssItems
        return rssItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RSSTableViewCell", for: indexPath) as! RSSTableViewCell
        
        if let item = rssItems?[indexPath.item] {
            
            
            cell.item = item
            cell.item.description = getContentFromHtml(urlString: item.description)
            cell.selectionStyle = .none
            
            
            //            if let cellStates = cellStates {
            //                cell.contentLabel.numberOfLines = (cellStates[indexPath.row] == .expanded) ? 0 : 4
            //            }
        }
        
        return cell
    }
    
    /*
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
     {
     tableView.deselectRow(at: indexPath, animated: true)
     let cell = RSSTableView.cellForRow(at: indexPath) as! RSSTableViewCell
     
     tableView.beginUpdates()
     cell.contentLabel.numberOfLines = (cell.contentLabel.numberOfLines == 0) ? 3 : 0
     
     cellStates?[indexPath.row] = (cell.contentLabel.numberOfLines == 0) ? .expanded : .collapsed
     
     tableView.endUpdates()
     }
     */
    
}

