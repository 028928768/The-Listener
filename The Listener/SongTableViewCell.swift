//
//  SongTableViewCell.swift
//  The Listener
//
//  Created by Kantachat Puagkajee on 23/9/2561 BE.
//  Copyright © 2561 Kantachat Puagkajee. All rights reserved.
//

import UIKit

class SongTableViewCell: UITableViewCell {
    //MARK: Properties any declairation here
    
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var artistSongLabel: UILabel!
    @IBOutlet weak var albumSongLabel: UILabel!
    @IBOutlet weak var arrowButton: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

   
    }
  

}
