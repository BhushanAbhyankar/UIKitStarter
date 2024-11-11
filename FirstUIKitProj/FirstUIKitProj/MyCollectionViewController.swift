//
//  MyCollectionViewController.swift
//  FirstUIKitProj
//
//  Created by Bhushan Abhyankar on 11/11/2024.
//

import UIKit

class MyCollectionViewController: UIViewController {
 

    @IBOutlet weak var myCollectionView: UICollectionView!
    var itemList = ["Jan","Feb","March", "April", "May", "June","July","Aug","Sept","Jan","Feb","March", "April", "May", "June","July","Aug","Sept","Jan","Feb","March", "April", "May", "June","July","Aug","Sept"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension MyCollectionViewController:UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        itemList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCellID", for: indexPath) as! MyCollectionViewCell
        cell.gridTitlelabel.text = itemList[indexPath.item]
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
}
extension MyCollectionViewController:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(itemList[indexPath.item])
    }
}
