//
//  ListViewController.swift
//  FirstUIKitProj
//
//  Created by Bhushan Abhyankar on 08/11/2024.
//
/*
 MVC- Model View Controller
 Model= Data part for ur app
 View- UI
 Contoller-
 
 MVVM
 
 Model
 View
 ViewModel - business logic
 */
import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet weak var myTabelview: UITableView!
    var networkManager = NetworkManager()
    var itemList = ["Jan","Feb","March", "April", "May", "June","July","Aug","Sept"]
    var weekdays = ["Sun","Mon","Tues", "Wed", "Thurs", "Frid","Sat"]
    var days = ["ABC","DEF","XYZ"]
    var users = [UserResponse]()
    var products = [Product]()
    
    deinit{
        print("deinit for listvc")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.myTabelview.dataSource = self
        self.myTabelview.delegate = self
        self.networkManager.delegate = self
        
        let newCellXib = UINib(nibName: "NewTableViewCell", bundle: nil)
        self.myTabelview.register(newCellXib, forCellReuseIdentifier: "NewCellID")
        
        DispatchQueue.global(qos: .utility).async {

//            self.networkManager.getDataFromAPIUsingProtocolDelegate(urlString: "https://jsonplaceholder.typicode.com/users", modelType: [UserResponse].self)
            
            self.networkManager.getDataFromAPIUsingProtocolDelegate(urlString: "https://fakestoreapi.com/products", modelType: [Product].self)
            
            self.networkManager.getDataFromAPI {  [weak self] usersList in
                self?.users = usersList
                DispatchQueue.main.async {
                    self?.myTabelview.reloadData()
                }
            }
        }
    }

    func getDataFromJSONFile(){
        
        let bundle = Bundle(for: ListViewController.self)
        
        guard let path = bundle.url(forResource: "Users", withExtension: "json") else{
            print("Failed")
            return
        }
        
        do{
         let data = try Data(contentsOf: path)
          let parsedData =  try JSONDecoder().decode([UserResponse].self, from: data)
            print("parsedData = \(parsedData)")
            users = parsedData
            DispatchQueue.main.async { [weak self] in
                self?.myTabelview.reloadData()
            }
        }catch{
            print(error.localizedDescription)
        }
    }
    
    
}
extension ListViewController:NetworkManagerDelegate{
    func didRecieveData<T:Decodable>(data:T){
        print("got response in didRecieveData")
        self.products = data as! [Product]
        DispatchQueue.main.async {
            self.myTabelview.reloadData()
        }
    }
    
    func didReceiveError(error: any Error) {
        
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
        case 3:
            return users.count
        case 4:
            return products.count
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
            
        case 3:
            let newCell = tableView.dequeueReusableCell(withIdentifier: "NewCellID", for: indexPath) as! NewTableViewCell
            let user = users[indexPath.row]
            
            newCell.titleLabelNewCell.text = user.name
            newCell.imageViewNewCell.image = UIImage(systemName: "person.fill")
            newCell.imageViewNewCell.tintColor = .orange
            newCell.descriptionLabelNewCell.text = user.website
            return newCell
            
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as! ListTableViewCell
            cell.titleLabelCell.text = products[indexPath.row].title
            cell.imageViewCell.image = UIImage(systemName: "storefront.fill")
            cell.imageViewCell.tintColor = .brown
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as! ListTableViewCell
            cell.titleLabelCell.text = itemList[indexPath.row]
            cell.imageViewCell.image = UIImage(systemName: "richtext.page.fill.he")
            cell.imageViewCell.tintColor = .red
            return cell
        }
        
      
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }

}
extension ListViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var userData:UserResponse?
        
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
        case 3:
            userData = users[indexPath.row]
            print("selected day = \(data)")
        default:
             data = itemList[indexPath.row]
            print("selected data = \(data)")
        }
        
        
        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let detailsViewController:DetailsViewController = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        detailsViewController.receivedData = data
        detailsViewController.user = userData
        self.navigationController?.pushViewController(detailsViewController, animated: true)
        
//        self.navigationController?.present(detailsViewController, animated: true)
    }
}
