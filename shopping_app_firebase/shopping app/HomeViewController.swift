//
//  HomeViewController.swift
//  shopping app
//
//  Created by 謝環宇 on 12/3/16.
//  Copyright © 2016 Nina. All rights reserved.
//

import UIKit
private let reuseIdentifier = "Cell"

var item:[Item] = [
    Item(name: "豬五花肉", img: "豬五花肉.jpg", price: 150, unit: "每台斤", description: "五花肉是豬腹部的肉，肥瘦相間，又稱為三層肉。五花肉油脂多，料理變化更是多樣化，煎煮炒炸都可以", buynumber: 0),
    Item(name: "豬肉香腸", img: "豬肉香腸.jpg", price: 160, unit: "每台斤", description: "我們採用上好的夾心豬肉，搭配台式的料理配方，做成美味的台式香腸。", buynumber: 0),
    Item(name: "豬肋排", img: "豬肋排.jpg", price: 180, unit: "每台斤", description: "含肋骨、肋間肌肉及部份背脊肉。", buynumber: 0),
    Item(name: "沙朗牛", img: "沙朗牛.jpg", price: 250, unit: "每盒(500g)", description: "沙朗牛排在美國指牛後腰脊柱兩側的肉，肉質細嫩。", buynumber: 0),
    Item(name: "雞蛋", img: "雞蛋.jpg", price: 35, unit: "每台斤", description: "採用農場當天運送新鮮雞蛋。", buynumber: 0),
    Item(name: "雞胸肉", img: "雞胸肉.jpg", price: 100, unit: "每台斤", description: "低脂肪、少油、營養的新鮮雞胸肉。", buynumber: 0),
    Item(name: "雞腿肉", img: "雞腿肉.jpg", price: 200, unit: "每台斤", description: "雞腿肉可以說是最受歡迎的部位，肉質軟嫩多汁。", buynumber: 0),
    Item(name: "高麗菜", img: "高麗菜.jpg", price: 50, unit: "每台斤", description: "當季新鮮高山高麗菜。", buynumber: 0),
    Item(name: "青蔥", img: "青蔥.jpg", price: 200, unit: "每台斤", description: "由宜蘭直送的三星蔥。", buynumber: 0),
    Item(name: "蒜頭", img: "蒜頭.jpg", price: 100, unit: "每台斤", description: "最好的台味調味料。", buynumber: 0)
]
//var itemNames = ["豬五花肉", "豬肉香腸", "豬肋排", "沙朗牛", "雞蛋", "雞胸肉", "雞腿肉", "青蔥", "高麗菜", "蒜頭"]
//var imgNames = ["豬五花肉.jpg", "豬肉香腸.jpg", "豬肋排.jpg", "沙朗牛.jpg", "雞蛋.jpg", "雞胸肉.jpg", "雞腿肉.jpg", "青蔥.jpg", "高麗菜.jpg", "蒜頭.jpg"]

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {


    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return item.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)as! HomeCollectionViewCell
        cell.nameLabel.text = item[indexPath.row].name
        cell.thumbnailImageView.image = UIImage(named: item[indexPath.row].img)
        return cell

    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let itemSender = item[indexPath.row]
        print(itemSender)
        self.performSegue(withIdentifier: "hometoitemSegue", sender: itemSender)

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "hometoitemSegue"
        {
            let controller = segue.destination as!itemViewController
            controller.item = sender as! Item
        }

    }
    
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "gotoItemPage"{
//            let indexPath = collectionView(UICollectionView, cellForItemAt: IndexPath){
//                let destinationController = segue.destination as! itemViewController
//                destinationController.itemImage = imgNames[indexPath.row]
//            }
//        }
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
