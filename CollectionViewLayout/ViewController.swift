//
//  ViewController.swift
//  CollectionViewLayout
//
//  Created by Joe Newbry on 2/17/17.
//  Copyright © 2017 MSFT. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {
    
    let expandedLayout = UICollectionViewFlowLayout()
    let normalLayout = UICollectionViewFlowLayout()
    let collapsedLayout = UICollectionViewFlowLayout()
    
    var isExpandedLayout = true

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var toggleLayout: UIButton!
    
    @IBAction func toggleLayout(_ sender: Any) {
       
        isExpandedLayout = !isExpandedLayout
        let newLayout = isExpandedLayout ? expandedLayout : normalLayout
        collectionView.setCollectionViewLayout(newLayout, animated: true)
        let firstItem = IndexPath(row: 0, section: 0)
        collectionView.scrollToItem(at: firstItem, at: .top, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        let halfScreenHeight = screenHeight / 2
        let quarterScreenHeight = screenHeight / 4
        
        expandedLayout.itemSize = CGSize(width: screenWidth, height: halfScreenHeight)
        normalLayout.itemSize = CGSize(width: screenWidth, height: quarterScreenHeight)
        
        collectionView.setCollectionViewLayout(expandedLayout, animated: false)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        
        collectionView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        collectionView.reloadData()
    }
    
    // MARK: CollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath)
        cell.backgroundColor = ((indexPath.row % 2) == 0) ? UIColor.blue : UIColor.green
        return cell
    }
}

