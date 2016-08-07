//
//  GIFCollectionViewCell.swift
//  GiphyTrends
//
//  Created by Jason Tezanos on 7/31/16.
//  Copyright © 2016 NA. All rights reserved.
//

import Foundation
import UIKit
import Gifu
import AASquaresLoading

protocol GIFCellProtocol {
    var type: String { get }
    var images: JSONDictionary { get }
    var GIFData: NSData { get set }
    var rating: String { get }
    var trendingDateTime: String { get }
    var dictionaryForFixedHeight: JSONDictionary { get }
    var urlForFixedHeightImage: String { get }
}

class GIFCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: AnimatableImageView!
    @IBOutlet weak var trendImageView: UIImageView!
    
    private var delegate: GIFCellProtocol?
    private var loadingSquare: AASquaresLoading?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initLoadingSquare()
    }
    func setupCell(withDelegate delegate: GIFCellProtocol) {
        self.delegate = delegate
        self.imageView.image = nil
        self.trendImageView.image = UIImage()
        loadingSquare?.start()
        self.imageView.gifFromUrl(self.delegate!.urlForFixedHeightImage) {
            self.loadingSquare?.stop()
            self.hasTrended()
        }

    }
    private func initLoadingSquare() {
        loadingSquare = AASquaresLoading(target: imageView)
        loadingSquare!.backgroundColor = UIColor.clearColor()
        loadingSquare!.color = UIColor.whiteColor()
    }
    private func hasTrended() {
        if self.delegate!.trendingDateTime.containsString("1970") || self.delegate!.trendingDateTime.containsString("0000-00-00") {
        } else {
            self.trendImageView.image = UIImage(named: "star")
        }
    }

}

