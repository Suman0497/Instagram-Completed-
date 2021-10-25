//
//  SearchPhotosViewController.swift
//  Instagram Clone App
//
//  Created by apple on 23/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

struct APIResponse: Codable {
    let total: Int
    let total_pages: Int
    let results: [Result]
    
}

struct Result: Codable {
    let id: String
    let urls: URLS
}

struct URLS: Codable {
    let regular: String
}

class SearchPhotosViewController: UIViewController, UICollectionViewDataSource, UISearchBarDelegate {
    
    
    
    let searchBar = UISearchBar()
    
    private var collectionView: UICollectionView?
    var results: [Result] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        view.addSubview(searchBar)
        
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: view.frame.size.width/2, height: view.frame.size.width/2)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
        collectionView.dataSource = self
       // collectionView.delegate = self
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        self.collectionView = collectionView
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        searchBar.frame = CGRect(x: 10, y: view.safeAreaInsets.top, width: view.frame.size.width - 20, height: 50)
        collectionView?.frame = CGRect(x: 0, y: view.safeAreaInsets.top+55, width: view.frame.size.width, height: view.frame.size.height-55)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        if let text = searchBar.text{
            results = []
            collectionView?.reloadData()
            fetchPhotos(query: text)
        }
    }
    
    
    
    func fetchPhotos(query: String){
        
        let urlString = "https://api.unsplash.com/search/photos?page=50&query=\(query)&client_id=XfQfr5ccZe8RsZGCQmJ_8lfAG13nutvzeQpaDD0D_VM"
        
        guard let url = URL(string: urlString) else {return}
        let task = URLSession.shared.dataTask(with: url) {[weak self] (data, _, error) in
            guard let data = data, error == nil else {
                return
            }
            do{
                let jsonResult = try JSONDecoder().decode(APIResponse.self, from: data)
                
                DispatchQueue.main.async {
                    self?.results = jsonResult.results
                    self?.collectionView?.reloadData()
                    
                }
            }catch{
                print(error)
                
            }
            
            
            
            
            
        }
        task.resume()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
        let imageURLString = results[indexPath.row].urls.regular
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath) as? ImageCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: imageURLString)
        return cell
        
    }
    
}
