//
//  SongTableViewCell.swift
//  The Listener
//
//  Created by Kantachat Puagkajee on 23/9/2561 BE.
//  Copyright © 2561 Kantachat Puagkajee. All rights reserved.
//

import UIKit

class SongTableViewCell: UITableViewCell {
    //MARK: Properties
    
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var artistSongLabel: UILabel!
    @IBOutlet weak var albumSongLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

   
    }
  

}
