//
//  ProductDetailViewController.swift
//  Shopify
//
//  Created by Kaori Persson on 2022-04-15.
//

import UIKit

class ProductDetailViewController: UIViewController, UIScrollViewDelegate {
    
    var product: Product?
    
    @IBOutlet weak var productImagesScrollView: UIScrollView! {
        didSet {
            productImagesScrollView.delegate = self
            productImagesScrollView.isPagingEnabled = true
            productImagesScrollView.showsHorizontalScrollIndicator = false
        }
    }
    
    @IBOutlet weak var productImagesPageControll: UIPageControl! {
        didSet {
            productImagesPageControll.isUserInteractionEnabled = false
        }
    }
    
    private let scrollHight: CGFloat = 200.0
    private let imageWidth: CGFloat = UIScreen.main.bounds.width
    
    private lazy var images: [UIImage] = {
        return [
            UIImage(named: "")!,
            UIImage(named: "")!,
            UIImage(named: "")!
        ]
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupImages()
    }
    
    private func setupImages() {
        productImagesScrollView.contentSize = CGSize(width: imageWidth * CGFloat(images.count),
                                                     height: scrollHight)
        
        for (index, image) in images.enumerated() {
            let imageView = UIImageView(frame: CGRect(x: imageWidth * CGFloat(index), y: 0, width: imageWidth, height: scrollHight))
            imageView.image = image
            imageView.contentMode = .scaleAspectFill
            productImagesScrollView.addSubview(imageView)
        }
        productImagesPageControll.numberOfPages = images.count

    }
    
    // MARK: UIScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        productImagesPageControll.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.width)
    }
}