//
//  RSSTableViewCell.swift
//  RSSTest
//
//  Created by 권민하 on 2020/04/01.
//  Copyright © 2020 권민하. All rights reserved.
//

import UIKit

//enum CellState {
//    case expanded
//    case collapsed
//}

class RSSTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
//    {
//        didSet {
//            contentLabel.numberOfLines = 3
//        }
//    }
    
    @IBOutlet weak var keyFirstLabel: UILabel!
    @IBOutlet weak var keySecondLabel: UILabel!
    @IBOutlet weak var keyThirdLabel: UILabel!
    
    var url : String = ""
    
    var item: RSSItem! {
        didSet {
            titleLabel.text = item.title
            contentLabel.text = item.description
            keyFirstLabel.text = item.pubDate
            url = item.description
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
