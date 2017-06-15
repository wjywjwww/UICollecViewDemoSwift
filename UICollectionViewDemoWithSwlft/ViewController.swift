//
//  ViewController.swift
//  UICollectionViewDemoWithSwlft
//
//  Created by sks on 17/5/26.
//  Copyright © 2017年 besttone. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    var collectionView : UICollectionView!
    var dataArray : [[ItemData]] = [[ItemData]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.loadData()
        
        let flowLayout = EqualSpaceFlowLayoutEvolve(with: AlignType.center)
        collectionView  = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowLayout)
        
        collectionView.backgroundColor = UIColor.lightGray
        collectionView.delegate = self
        collectionView.dataSource = self
        
        self.view.addSubview(collectionView)
        
        collectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerIdentifier")
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "CellIdentifier")
    }
    func loadData(){
        for _ in 0 ... 1{
            var dataArrayTemp = [ItemData]()
            for index in 0 ..< 10{
                let n = arc4random() % 10 + 1
                let itemData = ItemData()
                itemData.content = "\(index)"
                itemData.size = CGSize(width: CGFloat((n * 5)) + 50.0, height: 30)
                dataArrayTemp.append(itemData)
            }
            dataArray.append(dataArrayTemp)
        }
       
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataArray.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray[section].count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellIdentifier", for: indexPath) as! CustomCollectionViewCell
        let dataTemp = dataArray[indexPath.section]
        let itemData = dataTemp[indexPath.item]
        cell.content = itemData.content
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var reusableview : UICollectionReusableView = UICollectionReusableView()
        if (kind == UICollectionElementKindSectionHeader){
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerIdentifier", for: indexPath)
            reusableview = headerView
        }
        return reusableview
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 40)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let dataTemp = dataArray[indexPath.section]
        let itemData = dataTemp[indexPath.item]
        return itemData.size
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0{
            reduce(indexPath)
        }else{
            add(indexPath)
        }
    }
    func reduce(_ indePath : IndexPath){
        var dataTemp = dataArray[0]
        dataTemp.remove(at: indePath.item)
        dataArray[0] = dataTemp
//        let indexSet = IndexSet(integer: 0)
//        self.collectionView.reloadSections(indexSet)
        self.collectionView.reloadData()
    }
    func add(_ indePath : IndexPath){
        var dataTemp = dataArray[1]
        let n = arc4random() % 10 + 1
        let itemData = ItemData()
        itemData.content = "\(dataTemp.count)"
        itemData.size = CGSize(width: CGFloat((n * 5)) + 50.0, height: 30)
        dataTemp.append(itemData)
        dataArray[1] = dataTemp
//        let indexSet = IndexSet(integer: 1)
//        self.collectionView.reloadSections(indexSet)
        self.collectionView.reloadData()
    }
}

class ItemData: NSObject {
    var content : String = ""
    var size : CGSize = CGSize.zero
}









