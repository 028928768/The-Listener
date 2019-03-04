//
//  HomeTableViewCell.swift
//  The Listener
//
//  Created by Kanta'MacPro on 4/3/2562 BE.
//  Copyright © 2562 Kantachat Puagkajee. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    //MARK: properties
    @IBOutlet weak var playListCoverView: UIImageView!
    @IBOutlet weak var playListIconView: UIImageView!
    @IBOutlet weak var playListName: UILabel!
    @IBOutlet weak var playListDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
