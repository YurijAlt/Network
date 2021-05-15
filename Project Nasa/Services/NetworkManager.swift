//
//  NetworkManager.swift
//  Project Nasa
//
//  Created by Юрий Чекалюк on 04.05.2021.
//

import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    // MARK: - Parse with JSONDecoder()
    //
    //    func fetchData(from url: String?, with completion: @escaping ([APOD]) -> Void ) {
    //        guard let stringURL = url else { return }
    //        guard let url = URL(string: stringURL) else { return }
    //
    //        URLSession.shared.dataTask(with: url) { (data, _, error) in
    //            guard let data = data else {
    //                            print(error?.localizedDescription ?? "No error description")
    //                            return
    //            }
    //            do {
    //                let apods = try JSONDecoder().decode([APOD].self, from: data)
    //                DispatchQueue.main.async {
    //                    completion(apods)
    //                }
    //            } catch let error {
    //                print(error)
    //            }
    //        }.resume()
    //    }
    
    
    //MARK: - Parse manually using Alamofire
    func alamofireFetchData(from url: String?, completion: @escaping ([APOD]) -> Void) {
        AF.request(DataManager.shared.url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let valueData = APOD.getApods(from: value)
                    completion(valueData)
                case .failure(let error):
                    print(error)
                }
            }
    }
    
}





class ImageManager {
    
    static var shared = ImageManager()
    private init(){}
    
    func fetchImage(from url: URL, completion: @escaping(Data, URLResponse) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let response = response else {
                print(error?.localizedDescription ?? "No description")
                return
            }
            guard url == response.url else { return }
            DispatchQueue.main.async {
                
                completion(data, response)
            }
        }.resume()
        
        
    }
}






