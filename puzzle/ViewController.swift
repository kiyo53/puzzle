//
//  ViewController.swift
//  puzzle
//
//  Created by Ayumi Shimizu on 2018/01/18.
//  Copyright © 2018年 Ayumi Shimizu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    //collectionViewでUIICollectionViewを更新
    @IBOutlet var collectionView: UICollectionView!
 
    
    //フレームワークの基本型を10.0
    let cellMargin: CGFloat = 10.0
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let nib: UINib = UINib(nibName: "CollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "Cell")
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(self.handleGesture))
        rightSwipe.direction = .right
        collectionView.addGestureRecognizer(rightSwipe)
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(self.handleGesture))
        leftSwipe.direction = .left
        collectionView.addGestureRecognizer(leftSwipe)
        
        let upSwipe = UISwipeGestureRecognizer(target: self, action: #selector(self.handleGesture))
        upSwipe.direction = .up
        collectionView.addGestureRecognizer(upSwipe)
        
        let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(self.handleGesture))
        downSwipe.direction = .down
        collectionView.addGestureRecognizer(downSwipe)
        
        
    }
    
    @objc func handleGesture(sender: UISwipeGestureRecognizer) {
        var tmpImage: UIImage!
        let atIndexPath: IndexPath = collectionView.indexPathForItem(at: sender.location(in: collectionView))!
        var toIndexPath: IndexPath!
        
        print("atIndexPath:")
        print(atIndexPath)
        
        if sender.direction == .right {
            toIndexPath = IndexPath(row: atIndexPath.row + 1, section: atIndexPath.section)
//            let toIndex = collectionView.cellForItem(at: toIndexPath)as! CollectionViewCell
//            let atIndex = collectionView.cellForItem(at: atIndexPath)as! CollectionViewCell
//            tmpImage = toIndex.imageView.image
//            toIndex.imageView.image = atIndex.imageView.image
//            atIndex.imageView.image = tmpImage
//
        } else if sender.direction == .left {
            toIndexPath = IndexPath(row: atIndexPath.row - 1, section: atIndexPath.section)
//            let toIndex = collectionView.cellForItem(at: toIndexPath)as! CollectionViewCell
//            let atIndex = collectionView.cellForItem(at: atIndexPath)as! CollectionViewCell
//            tmpImage = toIndex.imageView.image
//            toIndex.imageView.image = atIndex.imageView.image
//            atIndex.imageView.image = tmpImage
            
        } else if sender.direction == .up {
            toIndexPath = IndexPath(row: atIndexPath.row, section: atIndexPath.section - 1)
//            let toIndex = collectionView.cellForItem(at: toIndexPath)as! CollectionViewCell
//            let atIndex = collectionView.cellForItem(at: atIndexPath)as! CollectionViewCell
//            tmpImage = toIndex.imageView.image
//            toIndex.imageView.image = atIndex.imageView.image
//            atIndex.imageView.image = tmpImage
            
        } else if sender.direction == .down {
            toIndexPath = IndexPath(row: atIndexPath.row, section: atIndexPath.section + 1)
        } else {
            print("Error: Can not get direction.")
            
        }
        
        print("toIndexPath")
        print(toIndexPath)
        
        guard let tocell = collectionView.cellForItem(at: toIndexPath) as? CollectionViewCell,
            let atcell = collectionView.cellForItem(at: atIndexPath) as? CollectionViewCell else { return }
        
        tmpImage = tocell.imageView.image
        tocell.imageView.image = atcell.imageView.image
        atcell.imageView.image = tmpImage
        print("toIndexPath: \(toIndexPath)")
        
        
     
        for x in 0..<collectionView.numberOfSections {
    
    let oneOf = collectionView.cellForItem(at: IndexPath(row: 0, section: x))as! CollectionViewCell
    let secondOf = collectionView.cellForItem(at: IndexPath(row: 1, section: x))as! CollectionViewCell
    let thirdOf = collectionView.cellForItem(at: IndexPath(row: 2, section: x))as! CollectionViewCell
    let forthOf = collectionView.cellForItem(at: IndexPath(row: 3, section: x))as! CollectionViewCell
    let fifthOf = collectionView.cellForItem(at: IndexPath(row: 4, section: x))as! CollectionViewCell
    
    if oneOf.imageView.image == secondOf.imageView.image && secondOf.imageView.image == thirdOf.imageView.image && thirdOf.imageView.image == forthOf.imageView.image && forthOf.imageView.image == fifthOf.imageView.image
    {
    print("横\(x + 1)列目が揃いました")
        oneOf.imageView.image = UIImage(named: "白.png")
        secondOf.imageView.image = UIImage(named: "白.png")
        thirdOf.imageView.image = UIImage(named: "白.png")
        forthOf.imageView.image = UIImage(named: "白.png")
        fifthOf.imageView.image = UIImage(named: "白.png")
        
    } else if oneOf.imageView.image == secondOf.imageView.image && secondOf.imageView.image == thirdOf.imageView.image && thirdOf.imageView.image == forthOf.imageView.image {
    
    print("横\(x + 1)列目が4個揃いました")
        oneOf.imageView.image = UIImage(named: "白.png")
        secondOf.imageView.image = UIImage(named: "白.png")
        thirdOf.imageView.image = UIImage(named: "白.png")
        forthOf.imageView.image = UIImage(named: "白.png")
       
    } else if secondOf.imageView.image == thirdOf.imageView.image && thirdOf.imageView.image == forthOf.imageView.image && forthOf.imageView.image == fifthOf.imageView.image {
        print("横\(x + 1)列目が4個揃いました")
        secondOf.imageView.image = UIImage(named: "白.png")
        thirdOf.imageView.image = UIImage(named: "白.png")
        forthOf.imageView.image = UIImage(named: "白.png")
        fifthOf.imageView.image = UIImage(named: "白.png")
        
    } else if oneOf.imageView.image == secondOf.imageView.image && secondOf.imageView.image == thirdOf.imageView.image  {
    
    print("横\(x + 1)列目が3個揃いました")
        oneOf.imageView.image = UIImage(named: "白.png")
        secondOf.imageView.image = UIImage(named: "白.png")
        thirdOf.imageView.image = UIImage(named: "白.png")
      
    } else if secondOf.imageView.image == thirdOf.imageView.image && thirdOf.imageView.image == forthOf.imageView.image {
        print("横\(x + 1)列目が3個揃いました")
        secondOf.imageView.image = UIImage(named: "白.png")
        thirdOf.imageView.image = UIImage(named: "白.png")
        forthOf.imageView.image = UIImage(named: "白.png")
        
            } else if  thirdOf.imageView.image == forthOf.imageView.image && forthOf.imageView.image == fifthOf.imageView.image {
        print("横\(x + 1)列目が3個揃いました")
        thirdOf.imageView.image = UIImage(named: "白.png")
        forthOf.imageView.image = UIImage(named: "白.png")
        fifthOf.imageView.image = UIImage(named: "白.png")
        
    } else {
    print("まだ揃っていません")
    }
        }
    
    for x in 0..<collectionView.numberOfSections{
        
        let oneOf = collectionView.cellForItem(at: IndexPath(row: x, section: 4))as! CollectionViewCell
        let secondOf = collectionView.cellForItem(at: IndexPath(row: x, section: 3))as! CollectionViewCell
        let thirdOf = collectionView.cellForItem(at: IndexPath(row: x, section: 2))as! CollectionViewCell
        let forthOf = collectionView.cellForItem(at: IndexPath(row: x, section: 1))as! CollectionViewCell
        let fifthOf = collectionView.cellForItem(at: IndexPath(row: x, section: 0))as! CollectionViewCell
        
        if oneOf.imageView.image == secondOf.imageView.image && secondOf.imageView.image == thirdOf.imageView.image && thirdOf.imageView.image == forthOf.imageView.image && forthOf.imageView.image == fifthOf.imageView.image
        {
            print("縦\(x + 1)列目が揃いました")
            oneOf.imageView.image = UIImage(named: "白.png")
            secondOf.imageView.image = UIImage(named: "白.png")
            thirdOf.imageView.image = UIImage(named: "白.png")
            forthOf.imageView.image = UIImage(named: "白.png")
            fifthOf.imageView.image = UIImage(named: "白.png")
            
        } else if oneOf.imageView.image == secondOf.imageView.image && secondOf.imageView.image == thirdOf.imageView.image && thirdOf.imageView.image == forthOf.imageView.image {
             print("縦\(x + 1)列目が4個揃いました")
            oneOf.imageView.image = UIImage(named: "白.png")
            secondOf.imageView.image = UIImage(named: "白.png")
            thirdOf.imageView.image = UIImage(named: "白.png")
            forthOf.imageView.image = UIImage(named: "白.png")
            
            
        }else if secondOf.imageView.image == thirdOf.imageView.image && thirdOf.imageView.image == forthOf.imageView.image && forthOf.imageView.image == fifthOf.imageView.image {
            print("縦\(x + 1)列目が4個揃いました")
            
            secondOf.imageView.image = UIImage(named: "白.png")
            thirdOf.imageView.image = UIImage(named: "白.png")
            forthOf.imageView.image = UIImage(named: "白.png")
            fifthOf.imageView.image = UIImage(named: "白.png")
            
        } else if oneOf.imageView.image == secondOf.imageView.image && secondOf.imageView.image == thirdOf.imageView.image {
            
            print("縦\(x + 1)列目が3個揃いました")
            oneOf.imageView.image = UIImage(named: "白.png")
            secondOf.imageView.image = UIImage(named: "白.png")
            thirdOf.imageView.image = UIImage(named: "白.png")
            forthOf.imageView.image = UIImage(named: "白.png")
            fifthOf.imageView.image = UIImage(named: "白.png")
            
        } else if secondOf.imageView.image == thirdOf.imageView.image && thirdOf.imageView.image == forthOf.imageView.image {
            print("縦\(x + 1)列目が3個揃いました")
            secondOf.imageView.image = UIImage(named: "白.png")
            thirdOf.imageView.image = UIImage(named: "白.png")
            forthOf.imageView.image = UIImage(named: "白.png")
            
        } else if  thirdOf.imageView.image == forthOf.imageView.image && forthOf.imageView.image == fifthOf.imageView.image {
            print("縦\(x + 1)列目が3個揃いました")
            thirdOf.imageView.image = UIImage(named: "白.png")
            forthOf.imageView.image = UIImage(named: "白.png")
            fifthOf.imageView.image = UIImage(named: "白.png")
            
            
        } else {
            print("まだ揃っていません")
        }
        }
    
        
        for x in 0..<collectionView.numberOfSections{
            
            let oneOf = collectionView.cellForItem(at: IndexPath(row: 0, section: x))as! CollectionViewCell
            let secondOf = collectionView.cellForItem(at: IndexPath(row: 1, section: x))as! CollectionViewCell
            let thirdOf = collectionView.cellForItem(at: IndexPath(row: 2, section: x))as! CollectionViewCell
            let forthOf = collectionView.cellForItem(at: IndexPath(row: 3, section: x))as! CollectionViewCell
            let fifthOf = collectionView.cellForItem(at: IndexPath(row: 4, section: x))as! CollectionViewCell
            
            if oneOf.imageView.image == secondOf.imageView.image && secondOf.imageView.image == thirdOf.imageView.image && thirdOf.imageView.image == forthOf.imageView.image && forthOf.imageView.image == fifthOf.imageView.image
            {
                print("横\(x + 1)列目が揃いました")
            } else if oneOf.imageView.image == secondOf.imageView.image && secondOf.imageView.image == thirdOf.imageView.image && thirdOf.imageView.image == forthOf.imageView.image || secondOf.imageView.image == thirdOf.imageView.image && thirdOf.imageView.image == forthOf.imageView.image && forthOf.imageView.image == fifthOf.imageView.image {
                
                print("横\(x + 1)列目が4個揃いました")
            } else if oneOf.imageView.image == secondOf.imageView.image && secondOf.imageView.image == thirdOf.imageView.image || secondOf.imageView.image == thirdOf.imageView.image && thirdOf.imageView.image == forthOf.imageView.image || thirdOf.imageView.image == forthOf.imageView.image && forthOf.imageView.image == fifthOf.imageView.image {
                
                print("横\(x + 1)列目が3個揃いました")
            } else {
                print("まだ揃っていません")
            }
    }
        }
    
        
//        let centerCell: CollectionViewCell = collectionView.cellForItem(at: toIndexPath) as! CollectionViewCell
//        let leftCell: CollectionViewCell = collectionView.cellForItem(at: IndexPath(row: toIndexPath.row - 1, section: toIndexPath.section)) as! CollectionViewCell
//        let rightCell: CollectionViewCell = collectionView.cellForItem(at: IndexPath(row: toIndexPath.row + 1, section: toIndexPath.section)) as! CollectionViewCell
//        let upCell: CollectionViewCell = collectionView.cellForItem(at: IndexPath(row: toIndexPath.row, section: toIndexPath.section - 1)) as! CollectionViewCell
//        let downCell: CollectionViewCell = collectionView.cellForItem(at: IndexPath(row: toIndexPath.row, section: toIndexPath.section + 1)) as! CollectionViewCell
//
//        if (centerCell.imageView.image == leftCell.imageView.image) && (centerCell.imageView.image == rightCell.imageView.image) {
//            print("横一列そろった！")
//        }
//
//        if toIndexPath.row - 2 >= 0 {
//        let left2Cell: CollectionViewCell = collectionView.cellForItem(at: IndexPath(row: toIndexPath.row - 2, section: toIndexPath.section)) as! CollectionViewCell
//
//        if (leftCell.imageView.image == left2Cell.imageView.image) && (leftCell.imageView.image == centerCell.imageView.image) {
//            print("横一列そろった！")
//        }
//        }
//
//        if toIndexPath.row + 2 <= 4 {
//        let right2Cell: CollectionViewCell = collectionView.cellForItem(at: IndexPath(row: toIndexPath.row + 2, section: toIndexPath.section)) as! CollectionViewCell
//
//       if (rightCell.imageView.image == centerCell.imageView.image) && (rightCell.imageView.image == right2Cell.imageView.image) {
//            print("横一列そろった！")
//        }
//        }
//    }
//
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

//}

    
    //セクション内のセルの個数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    //セクション数
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    //セルの設定
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.backgroundColor = UIColor.clear
        let imageArray:[String] = ["n1.png", "n2.png", "n3.png", "n4.png", "n5.png", "n6.png", "n7.png", "n8.png"]
        cell.imageView?.image = UIImage(named: imageArray[Int(arc4random_uniform(8))])
        
        
        return cell
    }
    
    //セルをタップした時
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)!
        
    }
    
    //セルのサイズ
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfMargin: Int = 4
        let numberOfCellInSection: Int = 5
        let width: CGFloat = (collectionView.frame.width - cellMargin * CGFloat(numberOfMargin)) / CGFloat(numberOfCellInSection)
        let height: CGFloat = width
        
        return CGSize(width: width, height: height)
    }
    
    //列間の余白
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return cellMargin
    }
    
    //行間の余白
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellMargin
    }
    
    //セクション間の余白
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetFOrSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0.0, left: 0.0, bottom: cellMargin, right: 0.0)
    }

    
    


}



