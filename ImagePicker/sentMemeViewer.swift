//
//  sentMemeViewer.swift
//  Memesicle
//
//  Created by John Nolan on 2/16/18.
//  Copyright © 2018 John Nolan. All rights reserved.
//

import Foundation
import UIKit

class sentMemeViewer: UIViewController {
    
    // Mark: Properties
    var memePic: UIImage!
    
    // Mark: Outlets
    @IBOutlet weak var memeImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memeImage.image = memePic
        self.navigationController?.navigationItem.backBarButtonItem?.title = "Sent Memes"
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear (_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }
}
