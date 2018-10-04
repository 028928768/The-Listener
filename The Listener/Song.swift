//
//  Song.swift
//  The Listener
//
//  Created by Kantachat Puagkajee on 23/9/2561 BE.
//  Copyright © 2561 Kantachat Puagkajee. All rights reserved.
//

import UIKit

class Song {
    
    //MARK: Properties
    
    var name: String
    var artist: String
    var album: String
   // var photo: UIImage?
    
    //MARK: Initialization
    
    init?(name: String,artist: String,album: String){
        
        //Check condition of initializer
        if name.isEmpty {
            return nil
        }
        
        //Initialize stored properties
        self.name = name
        self.artist = artist
        self.album = album
       // self.photo = photo
    }
}
