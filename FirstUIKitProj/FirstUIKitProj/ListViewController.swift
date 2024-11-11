//
//  ListViewController.swift
//  FirstUIKitProj
//
//  Created by Bhushan Abhyankar on 08/11/2024.
//

import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet weak var myTabelview: UITableView!
    
    var itemList = ["Jan","Feb","March", "April", "May", "June","July","Aug","Sept"]
    var weekdays = ["Sun","Mon","Tues", "Wed", "Thurs", "Frid","Sat"]
    var days = ["ABC","DEF","XYZ"]

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        self.myTabelview.dataSource = self
//        self.myTabelview.delegate = self
        
        
        let newCellXib = UINib(nibName: "NewTableViewCell", bundle: nil)
        self.myTabelview.register(newCellXib, forCellReuseIdentifier: "NewCellID")
        
    }
    
    
}
extension ListViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0:
            return itemList.count
        case 1:
            return weekdays.count
        case 2:
            return days.count
        default:
            return itemList.count
        }
      
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        
        switch indexPath.section{
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as! ListTableViewCell
            cell.titleLabelCell.text = itemList[indexPath.row]
            cell.imageViewCell.image = UIImage(systemName: "richtext.page.fill.he")
            cell.imageViewCell.tintColor = .red
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as! ListTableViewCell
            cell.titleLabelCell.text = weekdays[indexPath.row]
            cell.imageViewCell.image = UIImage(systemName: "book.closed.fill")
            cell.imageViewCell.tintColor = .green
            return cell
            
        case 2:
            let newCell = tableView.dequeueReusableCell(withIdentifier: "NewCellID", for: indexPath) as! NewTableViewCell
            newCell.titleLabelNewCell.text = days[indexPath.row]
            newCell.imageViewNewCell.image = UIImage(systemName: "appletv.fill")
            newCell.imageViewNewCell.tintColor = .magenta
            newCell.descriptionLabelNewCell.text = "Some written content for long desscription"
            return newCell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as! ListTableViewCell
            cell.titleLabelCell.text = itemList[indexPath.row]
            cell.imageViewCell.image = UIImage(systemName: "richtext.page.fill.he")
            cell.imageViewCell.tintColor = .red
            return cell
        }
        
      
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

}
extension ListViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var  data  = ""
        switch indexPath.section{
        case 0:
             data = itemList[indexPath.row]
            print("selected item = \(data)")
        case 1:
             data = weekdays[indexPath.row]
            print("selected weekday = \(data)")
        case 2:
             data = days[indexPath.row]
            print("selected day = \(data)")
        default:
             data = itemList[indexPath.row]
            print("selected data = \(data)")
        }
        
        
        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let detailsViewController:DetailsViewController = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        detailsViewController.receivedData = data
        self.navigationController?.pushViewController(detailsViewController, animated: true)
//        self.navigationController?.present(detailsViewController, animated: true)
    }
}
