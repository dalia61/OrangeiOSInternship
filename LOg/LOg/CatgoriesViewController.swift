//
//  CatgoriesViewController.swift
//  LOg
//
//  Created by Dalia on 24/08/2022.
//

import UIKit

class CatgoriesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var categories : [String] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    func fetchData() {
        let url = URL(string: "https://student.valuxapps.com/api/categories")!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                print("Categories")
                print(String(data: data, encoding: .utf8))
                var DIC = [String:Any]()
                do{
                    DIC = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: Any]
                    print(DIC["data"])
                    let DICData1 = DIC["data"] as! [String: Any]
                    print (DICData1["data"])
                    let DICData2 = DICData1["data"] as! [Any]
                    for item in DICData2{
                        if let element = item as? [String: Any]{
                            if let cateName = element["name"] as? String {
                                self.categories.append(cateName)
                            }
                        }
                    }
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }catch let error{
                    print(error)
                }
                }
            else if let error = error {
                    print("Failed \(error)")
                }
        }
        task.resume()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        cell.textLabel?.text = categories[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
}
