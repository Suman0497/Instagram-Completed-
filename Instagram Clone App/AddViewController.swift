//
//  AddViewController.swift
//  Instagram Clone App
//
//  Created by apple on 22/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

       
       var imageArr = [UIImage(named: "01"),
                       UIImage(named: "02"),
                       UIImage(named: "03"),
                       UIImage(named: "04"),
                       UIImage(named: "05"),
                       UIImage(named: "06"),
                       UIImage(named: "07"),
                       UIImage(named: "08"),
                       UIImage(named: "02"),
                       UIImage(named: "03"),
                       UIImage(named: "04"),
                       UIImage(named: "05"),
                       UIImage(named: "06"),
                       UIImage(named: "07"),
                       UIImage(named: "08")]
       
       
       
       
       override func viewDidLoad() {
           super.viewDidLoad()
           setupCollectionView()
       }
      
       
       func setupCollectionView() {
           let searchCollectionView = UICollectionView(frame: .zero, collectionViewLayout: getCompositionalLayout())
           searchCollectionView.frame = self.view.frame
           searchCollectionView.delegate = self
           searchCollectionView.dataSource = self
           searchCollectionView.backgroundColor = .white
           searchCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell2")
           self.view.addSubview(searchCollectionView)
       }
       
       func getCompositionalLayout() -> UICollectionViewCompositionalLayout {
           
           let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/3)))
           item.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1)
           
           
           //--------- Group 1 ---------//
           let group1Item1 = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2), heightDimension: .fractionalHeight(1)))
           group1Item1.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1)
           
           
           let nestedGroup1Item1 = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/2)))
           nestedGroup1Item1.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1)
           
           let nestedGroup2Item1 = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2), heightDimension: .fractionalHeight(1)))
           nestedGroup2Item1.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1)
           
           let nestedGroup2 = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/2)), subitems: [nestedGroup2Item1])
           
           let nestedGroup1 = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2), heightDimension: .fractionalHeight(1)), subitems: [nestedGroup1Item1, nestedGroup2])
           
           let group1 = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/3)), subitems: [group1Item1, nestedGroup1])
           
           
           //--------- Group 2 ---------//
           let group2Item1 = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .fractionalHeight(1)))
           group2Item1.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1)
           
           let group2 = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/3)), subitems: [group2Item1])
           
           
           //--------- Container Group ---------//
           let containerGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(600)), subitems: [item, group1, group2])
           
           let section = NSCollectionLayoutSection(group: containerGroup)
           let layout = UICollectionViewCompositionalLayout(section: section)
           return layout
           
           
           
           let group3Item1 = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .fractionalHeight(1)))
           group2Item1.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1)
           
           let group3 = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/3)), subitems: [group3Item1])
           
           /*
            
            //--------- Carousel ---------//
            let carouselItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.95), heightDimension: .absolute(200)))
            carouselItem.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
            
            let carouselGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(200)), subitems: [caraousalItem])
            
            let carouselSection = NSCollectionLayoutSection(group: carouselGroup)
            carouselSection.orthogonalScrollingBehavior = .paging
            
            carouselSection.visibleItemsInvalidationHandler = { (items, offset, environment) in
            items.forEach { item in
            let distanceFromCenter = abs((item.frame.midX - offset.x) - environment.container.contentSize.width / 2.0)
            let minScale: CGFloat = 0.7
            let maxScale: CGFloat = 1.1
            let scale = max(maxScale - (distanceFromCenter / environment.container.contentSize.width), minScale)
            item.transform = CGAffineTransform(scaleX: scale, y: scale)
            }
            }
            
            let layout = UICollectionViewCompositionalLayout(section: carouselSection)
            return layout
            */
       }
   }


   extension AddViewController: UICollectionViewDelegate, UICollectionViewDataSource {
       func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return imageArr.count
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell2", for: indexPath)
           let imageView = UIImageView(frame: cell.frame)
           imageView.image = imageArr[indexPath.row]
           imageView.contentMode = .scaleToFill
           cell.addView(view: imageView, left: 0, right: 0, top: 20, bottom: 20)
           //cell.backgroundColor = .random
           return cell
       }
   }

   extension UIColor {
       static var randomColor: UIColor {
           return UIColor(red: .random(in: 0.4...1),
                          green: .random(in: 0.4...1),
                          blue: .random(in: 0.4...1),
                          alpha: 1)
       }
   }

   extension UIView {
       func addView(view: UIView, left: CGFloat, right: CGFloat, top: CGFloat, bottom: CGFloat) {
           
           view.translatesAutoresizingMaskIntoConstraints = false
           self.addSubview(view)
           
           view.leftAnchor.constraint(equalTo: self.leftAnchor, constant: left).isActive = true
           view.rightAnchor.constraint(equalTo: self.rightAnchor, constant: right).isActive = true
           
           view.topAnchor.constraint(equalTo: self.topAnchor, constant: top).isActive = true
           view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: bottom).isActive = true
           
       }
   }

