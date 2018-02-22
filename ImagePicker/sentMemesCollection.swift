//
//  sentMemesCollection.swift
//  Memesicle
//
//  Created by John Nolan on 2/13/18.
//  Copyright © 2018 John Nolan. All rights reserved.
//

import Foundation
import UIKit

class sentMemesCollection: UICollectionViewController{
    
    // MARK: Properties
    var memes: [MemeEditorViewController.Meme]!
    var itemSpacing: CGFloat! = 3.0
    
    // MARK: Outlets
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.sentMemes
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title:"+", style: .plain, target: self, action: #selector(createNewMeme))
        navigationItem.title = "Sent Memes"
        
        //set parameters for flowlayout on collection view
        let width = ((view.frame.width) - (3 * itemSpacing))/4
        let height = ((view.frame.height) - (3 * itemSpacing))/5
        flowLayout.minimumInteritemSpacing = itemSpacing
        flowLayout.minimumLineSpacing = itemSpacing + 3
        flowLayout.itemSize = CGSize(width: width, height: height)
    }
    
    //function to take user to the meme editor screen
    @objc func createNewMeme(){
        let originalVC = self.storyboard?.instantiateViewController(withIdentifier: "MemeEditorViewController") as! MemeEditorViewController
        present(originalVC, animated: true, completion: nil)
    }
    
    // Mark: CollectionView Datasource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sentMemesCollectionCell", for: indexPath) as! sentMemesCollectionCell
        let memesCollection = memes[(indexPath as NSIndexPath).row]
        
        cell.memeImage.image = memesCollection.memeImage
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let meme = memes[(indexPath as NSIndexPath).row]
        let memeViewerVC = self.storyboard?.instantiateViewController(withIdentifier: "sentMemeViewer") as! sentMemeViewer
        print(meme.memeImage)
        memeViewerVC.memePic = meme.memeImage
        self.navigationController?.pushViewController(memeViewerVC, animated: true)
        
    }
}
