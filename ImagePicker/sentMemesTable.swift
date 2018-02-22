//
//  sentMemesTable.swift
//  Memesicle
//
//  Created by John Nolan on 2/13/18.
//  Copyright © 2018 John Nolan. All rights reserved.
//

import Foundation
import UIKit

class sentMemesTable: UITableViewController{
    
    var sentMemes: [MemeEditorViewController.Meme]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let applicationDelegate = UIApplication.shared.delegate as! AppDelegate
        sentMemes = applicationDelegate.sentMemes
        //create title and button to take user back to initial meme creator screen
        self.navigationItem.title = "Sent Memes"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title:"+", style: .plain, target: self, action: #selector(createNewMeme))
    }
    
    // function to take the user back to the create meme screen
    @objc func createNewMeme(){
        let originalVC = self.storyboard?.instantiateViewController(withIdentifier: "MemeEditorViewController") as! MemeEditorViewController
        present(originalVC, animated: true, completion: nil)
    }
    
    // Mark: TableView Datasource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sentMemes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sentMemesTableCell") as! sentMemesTableCell
        let sentMemes = self.sentMemes[(indexPath as NSIndexPath).row]
        cell.imageView?.image = sentMemes.memeImage
        cell.memeText.text = "\(sentMemes.topText) \(sentMemes.bottomtext)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let meme = sentMemes[(indexPath as NSIndexPath).row]
        let memeViewerVC = self.storyboard?.instantiateViewController(withIdentifier: "sentMemeViewer") as! sentMemeViewer
        memeViewerVC.memePic = meme.memeImage
        navigationController?.pushViewController(memeViewerVC, animated: true)
        
    }
    
    // had to use this to avoid an error with the app thinking a parameter on the table was set to 0 when it was set to default. answers I found online said the table cells sometimes have issues with being at the default and you have to set them to a height programmatically
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let rowHeight = (view.frame.height)/6
        return rowHeight
    }
}
