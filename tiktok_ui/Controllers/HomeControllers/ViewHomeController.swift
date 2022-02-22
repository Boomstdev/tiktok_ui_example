//
//  ViewController.swift
//  tiktok_ui
//
//  Created by BOICOMP21070028 on 15/2/2565 BE.
//

import UIKit
import AVKit

class ViewHomeController: UIViewController {
    
    //    var player: AVPlayer?
    
    @IBOutlet var collectionView: UICollectionView!
    
    let segment = UISegmentedControl(items: ["Following","For You"])
    let titleTextSelect = [NSAttributedString.Key.foregroundColor: UIColor.white]
    let titleTextNormal = [NSAttributedString.Key.foregroundColor: UIColor.gray]
    var isPlay = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: collectionView.frame.width , height: collectionView.frame.height)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .vertical
        //        print(collectionView.frame.width)
        //        print(collectionView.frame.height)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = layout
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.isPagingEnabled = true
        
        segment.selectedSegmentIndex = 1
        
        segment.setTitleTextAttributes(titleTextNormal, for: .normal)
        segment.setTitleTextAttributes(titleTextSelect, for: .selected)
        segment.selectedSegmentTintColor = .clear
        segment.backgroundColor = .clear
        self.navigationItem.titleView = segment
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        self.navigationController?.navigationBar.standardAppearance = appearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = self.navigationController?.navigationBar.standardAppearance
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //        self.view.layoutIfNeeded()
    }
    
}

extension ViewHomeController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videoList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = videoList[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionPlayerViewCell.indentify, for: indexPath) as! CollectionPlayerViewCell
        cell.playVideoWithFile(videoName:  item.video!)
        cell.config(videoItem: item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        print("willDisplay \(indexPath.item)")
        if !isPlay{
            if let cellPlayer = cell as? CollectionPlayerViewCell{
                print("Start \(cellPlayer.videoName)")
                isPlay = true
                    cellPlayer.playVideo()
            }
        }
    }
    
    
}

extension ViewHomeController: UIScrollViewDelegate {
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        collectionView.visibleCells.forEach { cell in
            // TODO: write logic to stop the video before it begins scrolling
            if let cellPlayer = cell as? CollectionPlayerViewCell{
                print("Stop \(cellPlayer.videoName)")
                    cellPlayer.pauseVideo()
            }
        }
           
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageHeight = scrollView.frame.height
        let pageOffset = scrollView.contentOffset.y
        let pageNumber = Int(pageOffset / pageHeight)
        
        collectionView.visibleCells.forEach { cell in
            // TODO: write logic to start the video after it ends scrolling
            if let cellPlayer = cell as? CollectionPlayerViewCell{
//                print(cellPlayer.videoName)
                let videoItem = videoList[pageNumber]
                
                if cellPlayer.videoName == videoItem.video {
                    cellPlayer.playVideo()
                    print("Start \(cellPlayer.videoName)")
                    print(isPlay)
                }
                
            }
        }
        
    }
}
