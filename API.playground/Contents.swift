import UIKit

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
                    print(element["name"])
                }
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
