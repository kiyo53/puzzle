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
    
    var indexArray: [Int] = []
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //変数の宣言
        //空っぽのbundle内のCollectionViewCellに初期化されたUINibオブジェクトを返す
        let nib: UINib = UINib(nibName: "CollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "Cell")
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        //スワイプする方向 このクラス内でタッチした時rightスワイプの方向は右に移動する
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(self.handleGesture))
        rightSwipe.direction = .right
        collectionView.addGestureRecognizer(rightSwipe)
       
        //leftスワイプの方向は左ですよ
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(self.handleGesture))
        leftSwipe.direction = .left
        collectionView.addGestureRecognizer(leftSwipe)
        
        //upスワイプの方向は上ですよ
        let upSwipe = UISwipeGestureRecognizer(target: self, action: #selector(self.handleGesture))
        upSwipe.direction = .up
        collectionView.addGestureRecognizer(upSwipe)
        
        //downスワイプの方向は下ですよ
        let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(self.handleGesture))
        downSwipe.direction = .down
        collectionView.addGestureRecognizer(downSwipe)
        
        
    }
    
    @objc func handleGesture(sender: UISwipeGestureRecognizer) {
        //変数の宣言　tmpImageという箱の中に画像が入る
        var tmpImage: UIImage!
        //定数の宣言　atIndexPathの中にタッチした場所のデータを記録
        let atIndexPath: IndexPath = collectionView.indexPathForItem(at: sender.location(in: collectionView))!
        //変数の宣言　collextionViewCell内のタッチした場所のデータが入るであろう変数がtoIndexPath
        var toIndexPath: IndexPath!
       
        print("atIndexPath:")
        //タップした場所の座標
        print(atIndexPath)
        
        //右方向にスワイプする時
        if sender.direction == .right {
            //toIndexPathの中に行が一列右で列は変わらないIndexPathが入っている
            toIndexPath = IndexPath(row: atIndexPath.row + 1, section: atIndexPath.section)
//            let toIndex = collectionView.cellForItem(at: toIndexPath)as! CollectionViewCell
//            let atIndex = collectionView.cellForItem(at: atIndexPath)as! CollectionViewCell
//            tmpImage = toIndex.imageView.image
//            toIndex.imageView.image = atIndex.imageView.image
//            atIndex.imageView.image = tmpImage
//
            //左方向にスワイプする時
        } else if sender.direction == .left {
            //toIndexPathの中に行が一列左で列は変わらないIndexPathが入っている
            toIndexPath = IndexPath(row: atIndexPath.row - 1, section: atIndexPath.section)
//            let toIndex = collectionView.cellForItem(at: toIndexPath)as! CollectionViewCell
//            let atIndex = collectionView.cellForItem(at: atIndexPath)as! CollectionViewCell
//            tmpImage = toIndex.imageView.image
//            toIndex.imageView.image = atIndex.imageView.image
//            atIndex.imageView.image = tmpImage
            
            //上方向にスワイプする時
        } else if sender.direction == .up {
            //toIndexPathの中に列が一列上で行は変わらないIndexPathが入っている
            toIndexPath = IndexPath(row: atIndexPath.row, section: atIndexPath.section - 1)
//            let toIndex = collectionView.cellForItem(at: toIndexPath)as! CollectionViewCell
//            let atIndex = collectionView.cellForItem(at: atIndexPath)as! CollectionViewCell
//            tmpImage = toIndex.imageView.image
//            toIndex.imageView.image = atIndex.imageView.image
//            atIndex.imageView.image = tmpImage
            
            //下方向にスワイプする時
        } else if sender.direction == .down {
            //toIndexPathの中に列が一列下で行は変わらないIndexPathが入っている
            toIndexPath = IndexPath(row: atIndexPath.row, section: atIndexPath.section + 1)
        } else {
            print("Error: Can not get direction.")
            
        }
        
        print("toIndexPath")
        //移動した後の座標
        print(toIndexPath)
        //処理を中断
        guard let tocell = collectionView.cellForItem(at: toIndexPath) as? CollectionViewCell,
            let atcell = collectionView.cellForItem(at: atIndexPath) as? CollectionViewCell else { return }
        
        //tmpImageという箱の中に移動した後のセルが入る
        tmpImage = tocell.imageView.image
        //移動した後のセルに最初にタッチしたセルが入る
        tocell.imageView.image = atcell.imageView.image
        //タッチしたセルにtmpImageという箱が入る
        atcell.imageView.image = tmpImage
        print("toIndexPath: \(toIndexPath)")
        
        
     //0からcollectionView.numberOfSectionsの中で
        for x in 0..<collectionView.numberOfSections {
    
    //変数の宣言
    //oneofには行が一番左で列がxのセルが入っている
    let oneOf = collectionView.cellForItem(at: IndexPath(row: 0, section: x))as! CollectionViewCell
    //secondofには行が左から２列目で列がxのセルが入っている
    let secondOf = collectionView.cellForItem(at: IndexPath(row: 1, section: x))as! CollectionViewCell
    //thirdofには行が真ん中で列がxのセルが入っている
    let thirdOf = collectionView.cellForItem(at: IndexPath(row: 2, section: x))as! CollectionViewCell
    //forthofには行が右から2番目で列がxのセルが入っている
    let forthOf = collectionView.cellForItem(at: IndexPath(row: 3, section: x))as! CollectionViewCell
    //fifthofには行が一番右で列がxのセルが入っている
    let fifthOf = collectionView.cellForItem(at: IndexPath(row: 4, section: x))as! CollectionViewCell
    
    //hanteiという関数の中身は引数xに整数、引数indexArrayに整数が入っている
        func hantei(x: Int, indexArray: [Int]){
        //iの中にindexArrayの中の整数が入る
        for i in indexArray {
        //yの中に0からxまで入れる
            for y in (0...x).reversed() {
                if y > 0{
                 //hanteiOfは行がiで列がyのセルだと宣言します
                    let hanteiOf = collectionView.cellForItem(at: IndexPath(row: i, section: y))as!CollectionViewCell
                //ueOfは行がiで列がy-1のセルだと宣言します
                    let ueOf = collectionView.cellForItem(at: IndexPath(row: i, section: y - 1))as!CollectionViewCell
                //hanteiOfのimageViewのimageにueOfのimageViewのimageが入ります
                    hanteiOf.imageView.image = ueOf.imageView.image
                }else{
                 //saisyoOfは行がiで列が0のセルだと宣言します
                    let saisyoOf = collectionView.cellForItem(at: IndexPath(row: i, section: 0))as!CollectionViewCell
                    //saisyoOfのimageViewに入るimageはUIImage
                    saisyoOf.imageView.image = UIImage(named: imageArray[Int(arc4random_uniform(8))])
                        }
                    }
                }
            }
    //セルが横一列全て揃った時
    if oneOf.imageView.image == secondOf.imageView.image && secondOf.imageView.image == thirdOf.imageView.image && thirdOf.imageView.image == forthOf.imageView.image && forthOf.imageView.image == fifthOf.imageView.image
    {
    print("横\(x + 1)列目が揃いました")
        //全てのセルを真っ白の画像に変える
        oneOf.imageView.image = UIImage(named: "白.png")
        secondOf.imageView.image = UIImage(named: "白.png")
        thirdOf.imageView.image = UIImage(named: "白.png")
        forthOf.imageView.image = UIImage(named: "白.png")
        fifthOf.imageView.image = UIImage(named: "白.png")
        
        //セルが一番右以外揃った時
    } else if oneOf.imageView.image == secondOf.imageView.image && secondOf.imageView.image == thirdOf.imageView.image && thirdOf.imageView.image == forthOf.imageView.image {
    
    print("横\(x + 1)列目が4個揃いました")
        //一番右以外のセルを真っ白の画像に変える
        oneOf.imageView.image = UIImage(named: "白.png")
        secondOf.imageView.image = UIImage(named: "白.png")
        thirdOf.imageView.image = UIImage(named: "白.png")
        forthOf.imageView.image = UIImage(named: "白.png")
       
        //セルが一番左以外揃った時
    } else if secondOf.imageView.image == thirdOf.imageView.image && thirdOf.imageView.image == forthOf.imageView.image && forthOf.imageView.image == fifthOf.imageView.image {
        indexArray = [1, 2, 3, 4]
        hantei(x:)
        print("横\(x + 1)列目が4個揃いました")
        //一番左以外のセルを真っ白の画像に変える
//        secondOf.imageView.image = UIImage(named: "白.png")
//        thirdOf.imageView.image = UIImage(named: "白.png")
//        forthOf.imageView.image = UIImage(named: "白.png")
//        fifthOf.imageView.image = UIImage(named: "白.png")
        
        //セルが右の二つ以外揃った時
    } else if oneOf.imageView.image == secondOf.imageView.image && secondOf.imageView.image == thirdOf.imageView.image  {
    
    print("横\(x + 1)列目が3個揃いました")
        //揃ったセルを真っ白の画像に変える
        oneOf.imageView.image = UIImage(named: "白.png")
        secondOf.imageView.image = UIImage(named: "白.png")
        thirdOf.imageView.image = UIImage(named: "白.png")
      
        //セルが一番左と右以外揃った時
    } else if secondOf.imageView.image == thirdOf.imageView.image && thirdOf.imageView.image == forthOf.imageView.image {
        print("横\(x + 1)列目が3個揃いました")
        //揃ったセルを真っ白の画像に変える
        secondOf.imageView.image = UIImage(named: "白.png")
        thirdOf.imageView.image = UIImage(named: "白.png")
        forthOf.imageView.image = UIImage(named: "白.png")
        
        //セルが左の二つ以外揃った時
    } else if  thirdOf.imageView.image == forthOf.imageView.image && forthOf.imageView.image == fifthOf.imageView.image {
        print("横\(x + 1)列目が3個揃いました")
        //揃ったセルを真っ白の画像に変える
        thirdOf.imageView.image = UIImage(named: "白.png")
        forthOf.imageView.image = UIImage(named: "白.png")
        fifthOf.imageView.image = UIImage(named: "白.png")
        
        //まだ三つ以上揃っていない時
    } else {
    print("まだ揃っていません")
    }
        }

        //0からcollectionView.numberOfSectionsの中で
    for x in 0..<collectionView.numberOfSections{
        //oneofには行がxで列が一番上のセルが入っている
        let oneOf = collectionView.cellForItem(at: IndexPath(row: x, section: 4))as! CollectionViewCell
        //secondofには行がxで列が上から2番目のセルが入っている
        let secondOf = collectionView.cellForItem(at: IndexPath(row: x, section: 3))as! CollectionViewCell
        //thirdofには行がxで列が真ん中のセルが入っている
        let thirdOf = collectionView.cellForItem(at: IndexPath(row: x, section: 2))as! CollectionViewCell
        //forthofには行がxで列が下から2番目のセルが入っている
        let forthOf = collectionView.cellForItem(at: IndexPath(row: x, section: 1))as! CollectionViewCell
        //fifthofには行がx左で列が一番下のセルが入っている
        let fifthOf = collectionView.cellForItem(at: IndexPath(row: x, section: 0))as! CollectionViewCell
        
        
        //セルが縦一列揃った時
        if oneOf.imageView.image == secondOf.imageView.image && secondOf.imageView.image == thirdOf.imageView.image && thirdOf.imageView.image == forthOf.imageView.image && forthOf.imageView.image == fifthOf.imageView.image
        {
            print("縦\(x + 1)列目が揃いました")
            //全てのセルを真っ白の画像に変える
            oneOf.imageView.image = UIImage(named: "白.png")
            secondOf.imageView.image = UIImage(named: "白.png")
            thirdOf.imageView.image = UIImage(named: "白.png")
            forthOf.imageView.image = UIImage(named: "白.png")
            fifthOf.imageView.image = UIImage(named: "白.png")
            
            //セルが一番下以外揃った時
        } else if oneOf.imageView.image == secondOf.imageView.image && secondOf.imageView.image == thirdOf.imageView.image && thirdOf.imageView.image == forthOf.imageView.image {
             print("縦\(x + 1)列目が4個揃いました")
            //揃ったセルを真っ白の画像に変える
            oneOf.imageView.image = UIImage(named: "白.png")
            secondOf.imageView.image = UIImage(named: "白.png")
            thirdOf.imageView.image = UIImage(named: "白.png")
            forthOf.imageView.image = UIImage(named: "白.png")
            
            //セルが一番上以外揃った時
        }else if secondOf.imageView.image == thirdOf.imageView.image && thirdOf.imageView.image == forthOf.imageView.image && forthOf.imageView.image == fifthOf.imageView.image {
            print("縦\(x + 1)列目が4個揃いました")
            //揃ったセルを真っ白に変える
            secondOf.imageView.image = UIImage(named: "白.png")
            thirdOf.imageView.image = UIImage(named: "白.png")
            forthOf.imageView.image = UIImage(named: "白.png")
            fifthOf.imageView.image = UIImage(named: "白.png")
            
            //セルが下二つ以外揃った時
        } else if oneOf.imageView.image == secondOf.imageView.image && secondOf.imageView.image == thirdOf.imageView.image {
            print("縦\(x + 1)列目が3個揃いました")
            //揃ったセルを真っ白の画像に変える
            oneOf.imageView.image = UIImage(named: "白.png")
            secondOf.imageView.image = UIImage(named: "白.png")
            thirdOf.imageView.image = UIImage(named: "白.png")
           
            //セルが一番上と下以外揃った時
        } else if secondOf.imageView.image == thirdOf.imageView.image && thirdOf.imageView.image == forthOf.imageView.image {
            print("縦\(x + 1)列目が3個揃いました")
            //揃ったセルを真っ白に変える
            secondOf.imageView.image = UIImage(named: "白.png")
            thirdOf.imageView.image = UIImage(named: "白.png")
            forthOf.imageView.image = UIImage(named: "白.png")
            
            //セルが上二つ以外揃った時
        } else if  thirdOf.imageView.image == forthOf.imageView.image && forthOf.imageView.image == fifthOf.imageView.image {
            print("縦\(x + 1)列目が3個揃いました")
            //揃ったセルを真っ白に変える
            thirdOf.imageView.image = UIImage(named: "白.png")
            forthOf.imageView.image = UIImage(named: "白.png")
            fifthOf.imageView.image = UIImage(named: "白.png")
            
            //まだ三つ以上揃っていない時
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
        //セルの背景の色
        cell.backgroundColor = UIColor.clear
        //セル一つ一つの画像
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
        //列数の最大値は5
        let numberOfCellInSection: Int = 5
        //セルの幅
        let width: CGFloat = (collectionView.frame.width - cellMargin * CGFloat(numberOfMargin)) / CGFloat(numberOfCellInSection)
        //セルの高さ
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



