//
//  CatgoriesViewController.swift
//  O-Store
//
//  Created by Dalia on 28/08/2022.

import UIKit

class CatgoriesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var categories: [Key] = []
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getCategories()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = categories[indexPath.row].name
        cell.textLabel?.textColor = .black

        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
                
        let url = URL(string: categories[indexPath.row].image?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")!
        let download = URLSession.shared.dataTask(with: url) { [weak self] (data, _, _) in
            if let data = data {
                DispatchQueue.main.async {
                    imageView.image = UIImage(data: data)
                    cell.accessoryView = imageView
                }
            }
        }

        download.resume()

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController: CatViewController = storyboard.instantiateViewController(withIdentifier: "CatViewController") as! CatViewController
        navigationController?.pushViewController(viewController, animated: true)

    }

    func getCategories() {
        let url = URL(string: "https://student.valuxapps.com/api/categories")!

        let task = URLSession.shared.dataTask(with: url) { data, _, error in

            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(CategoryResponse.self, from: data)

                    for item in response.data?.data ?? [] {
                        self.categories.append(item)
                    }

                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }

                } catch let error {
                    print(error)
                    DispatchQueue.main.async {
                        let error = UIAlertController(title: "Request Failed", message: "Failed To Load Data", preferredStyle: .alert)
                        let back = UIAlertAction(title: "Try Again", style: .default, handler: { _ in
                        })
                        error.addAction(back)
                        self.present(error, animated: true, completion: nil)
                    }
                }

            } else if let error = error {
                print(error)
                DispatchQueue.main.async {
                    let error = UIAlertController(title: "Request Failed", message: "Failed To Load Data", preferredStyle: .alert)
                    let back = UIAlertAction(title: "Try Again", style: .default, handler: { _ in
                    })
                    error.addAction(back)
                    self.present(error, animated: true, completion: nil)
                }
            }
        }
        task.resume()
    }
}

// MARK: - CategoryResponse

struct CategoryResponse: Codable {
    let status: Bool?
    let message: String?
    let data: DataClass?
}

// MARK: - DataClass

struct DataClass: Codable {
    let currentPage: Int?
    let data: [Key]?
    let firstPageURL: String?
    let from, lastPage: Int?
    let lastPageURL: String?
    let nextPageURL: String?
    let path: String?
    let perPage: Int?
    let prevPageURL: String?
    let to, total: Int?

    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case data
        case firstPageURL = "first_page_url"
        case from
        case lastPage = "last_page"
        case lastPageURL = "last_page_url"
        case nextPageURL = "next_page_url"
        case path
        case perPage = "per_page"
        case prevPageURL = "prev_page_url"
        case to, total
    }
}

// MARK: - Key

struct Key: Codable {
    let id: Int?
    let name: String?
    let image: String?
}
