//
//  HomeCollection.swift
//  The Listener
//
//  Created by Kanta'MacPro on 4/3/2562 BE.
//  Copyright © 2562 Kantachat Puagkajee. All rights reserved.
//

import UIKit


class Home {
    //MARK: Properties
    var playListName: String
    var playListCover: UIImage?
    var playListDiscription: String
    var playListIcon: UIImage?
    
    //MARK: Initialization
    init? (playListName:String, playListCover: UIImage?, playListDiscription: String, playListIcon: UIImage?){
    //check if playlist name is exist?
        if playListName.isEmpty {
            return nil
        }
        
        //Initialize values
        self.playListName = playListName
        self.playListCover = playListCover
        self.playListDiscription = playListDiscription
        self.playListIcon = playListIcon
    
        }
}
