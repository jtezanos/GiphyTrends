//
//  SearchViewController.swift
//  GiphyTrends
//
//  Created by Jason Tezanos on 8/5/16.
//  Copyright © 2016 NA. All rights reserved.
//

import Foundation
import UIKit

class SearchViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var searchString: String?
    let parser = Parser()
    let alamoHandler = AlamoHandler()
    var GIFs = [GIF]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = searchString!
        getGIFsFromSearch()
    }
    
    //MARK: - CollectionView Data Source
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.GIFs.count
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(Constants.GIFCellReuseIdentifier, forIndexPath: indexPath) as! GIFCollectionViewCell
        
        cell.setupCell(withDelegate: GIFViewModel(GIFAtIndex: self.GIFs[indexPath.row]))
        
        return cell
    }
    
    //MARK: - CollectionView Display -> reference Animatable
    func collectionView(collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        cell.animateCellDisplay(indexPath.row, viewController: self)
    }
    
    //MARK: - CollectionView FlowLayout
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let cellSize = collectionView.bounds.size.width/2 - 4
        return CGSizeMake(cellSize,cellSize)
    }
    
    //MARK: - Get GIFs from search term via Giphy
    func getGIFsFromSearch() {
        self.alamoHandler.makeRequestGetGIFs(.GET, urlPath: .Search, parameters: [Keys.searchStringKey: self.searchString!]) { (GIFs) in
            self.GIFs = GIFs
            self.collectionView.reloadData()
        }
    }

}
