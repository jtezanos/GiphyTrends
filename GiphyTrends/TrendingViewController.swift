//
//  TrendingViewController.swift
//  GiphyTrends
//
//  Created by Jason Tezanos on 7/29/16.
//  Copyright © 2016 NA. All rights reserved.
//

import UIKit

class TrendingViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let parser = Parser()
    let alamoHandler = AlamoHandler()
    var GIFs = [GIF]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    var refreshControl: UIRefreshControl!
    
    //MARK: - Settings Nav Press
    @IBAction func settingsPress(sender: AnyObject) {
        let settingsNavigationController = storyboard!.instantiateViewControllerWithIdentifier(Constants.settingsNavigationControllerName) as! NavigationController
        self.presentViewController(settingsNavigationController, animated:true, completion:nil)
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        getGIFs { }
        setupSearchBar()
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(TrendingViewController.refresh(_:)), forControlEvents: .ValueChanged)
        collectionView.addSubview(refreshControl)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Refresh Method for UIRefreshControl
    func refresh(sender:AnyObject) {
        getGIFs { self.refreshControl.endRefreshing() }
    }
    
    //MARK: - Get GIFs from Giphy
    func getGIFs(completion: (Void) -> Void) {
        alamoHandler.makeRequestGetGIFs(.GET, urlPath: .Trending, parameters: [:]) { (GIFs) in
            self.GIFs = GIFs
            self.collectionView.reloadData()
            completion()
        }
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
        self.searchBar.endEditing(true)
        //Animateable
        cell.animateCellDisplay(indexPath.row, viewController: self)
    }
    
    //MARK: - CollectionView FlowLayout
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let cellSize = collectionView.bounds.size.width/2 - 4
        return CGSizeMake(cellSize,cellSize)
    }

}

//MARK: - Search Bar Delegate
extension TrendingViewController: UISearchBarDelegate {
    func setupSearchBar() {
        self.searchBar.delegate = self
    }
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        if searchBar.text?.isEmpty == true {
            return
        }
        self.searchBar.endEditing(true)
        let searchViewController = storyboard!.instantiateViewControllerWithIdentifier(Constants.searchViewControllerName) as! SearchViewController
        searchViewController.searchString = searchBar.text
        self.navigationController?.pushViewController(searchViewController, animated: true)
    }
}
