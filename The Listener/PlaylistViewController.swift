//
//  PlaylistViewController.swift
//  The Listener
//
//  Created by Kanta'MacPro on 6/3/2562 BE.
//  Copyright © 2562 Kantachat Puagkajee. All rights reserved.
//

import UIKit

class PlaylistViewController: UIViewController {
    //MARK: Properties
    
    @IBOutlet weak var playListCover: UIImageView!
    @IBOutlet weak var playListName: UILabel!
    @IBOutlet weak var playListDiscription: UILabel!
    //button

    
    var selectedPlayList : Home?

    override func viewDidLoad() {
        super.viewDidLoad()

        playListCover.image = selectedPlayList?.playListCover
        playListName.text = selectedPlayList?.playListName
        playListDiscription.text = selectedPlayList?.playListDiscription
    }
    
    //MARK: Actions
    
   
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
