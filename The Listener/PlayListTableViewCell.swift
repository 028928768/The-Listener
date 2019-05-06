//
//  PlayListTableViewCell.swift
//  The Listener
//
//  Created by Kanta'MacPro on 6/5/2562 BE.
//  Copyright © 2562 Kantachat Puagkajee. All rights reserved.
//

import UIKit

class PlayListTableViewCell: UITableViewCell {
    //MARK: Tablecell properties
    @IBOutlet weak var trackName: UILabel!
    @IBOutlet weak var trackArtist: UILabel!
    @IBOutlet weak var trackAlbum: UILabel!
    @IBOutlet weak var trackArrow: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
