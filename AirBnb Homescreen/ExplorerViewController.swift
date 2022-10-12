//
//  ViewController.swift
//  AirBnb Homescreen
//
//  Created by Gogua on 9.10.2022.
//

import UIKit

class ExplorerViewController: UIViewController {
    let tablecelIdentifier = "TableViewCell"
    
    @IBOutlet weak var searchView: UIView! {
        didSet {
            searchView.layer.cornerRadius = 30
            searchView.layer.shadowOffset = CGSize(width: 2, height: 2)
            searchView.layer.shadowOpacity = 0.2
            searchView.layer.shadowColor = UIColor.black.cgColor
            searchView.layer.masksToBounds = false
        }
    }
    @IBOutlet weak var searcTextfield: UITextField!
    @IBOutlet weak var categoryCollectionView: UICollectionView! {
        didSet {
            var design = UICollectionViewLayout()
            
        }
    }
    @IBOutlet weak var SearcBar: UISearchBar!
    
    var list = [ListItem]()
    var tableList = [Description]()
    
    @IBOutlet weak var Table: UITableView!
    
    override func viewDidLoad() {
        searcTextfield.layer.borderColor = UIColor.white.cgColor
        
        searcTextfield.layer.masksToBounds = true
        self.Table.register(.init(nibName: "TableViewCell", bundle: nil),  forCellReuseIdentifier: tablecelIdentifier)
        self.list.append(ListItem(image: "iconEv", label: "Design"))
        self.list.append(ListItem(image: "iconAda", label: "Camping"))
        self.list.append(ListItem(image: "iconView", label: "Surfing"))
        self.list.append(ListItem(image: "iconKale", label: "National Parks"))
        self.list.append(ListItem(image: "iconSezlong", label: "Desert"))
        self.list.append(ListItem(image: "iconEv", label: "Design"))
        self.list.append(ListItem(image: "iconAda", label: "Camping"))
        self.list.append(ListItem(image: "iconAda", label: "Camping"))
        
        self.tableList.append(Description(imageName: "home1", title: "Two Rivers Wisconsin", desc: "Design by Frank Lloyd", date:"Jun 6-13", price: "$567", nightPrice: "night", starred: "4.7"))
        self.tableList.append(Description(imageName: "home2",title: "Kapadokya Cave Suit", desc: "Design by Michele Dloy", date:"Jun 19-13", price: "$217", nightPrice: "night", starred: "4.9"))
        self.tableList.append(Description(imageName: "home3",title: "London View", desc: "Dasylio Beach", date:"Jun 19-13", price: "$667", nightPrice: "night", starred: "4.1"))
        self.tableList.append(Description(imageName: "home4",title: "Two Rivers Wisconsin", desc: "Peralia Pefkari", date:"Jun 19-13", price: "$167", nightPrice: "night", starred: "4.5"))
        self.tableList.append(Description(imageName: "home5",title: "Imereti Georgia", desc: "Design by Michele Dloy", date:"Jun 19-13", price: "$867", nightPrice: "night", starred: "4.7"))
        
        Table.dataSource = self
        Table.delegate = self
        categoryCollectionView.dataSource = self
        
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.size.width
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: (screenWidth - 90 )/5, height: screenWidth*0.2)
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 15
        layout.minimumLineSpacing = 24
        categoryCollectionView.isPagingEnabled = true
        categoryCollectionView.collectionViewLayout = layout
    }
    
    class ListItem {
        var image : String?
        var label : String?
        
        init(image : String, label:String) {
            self.image = image
            self.label = label
        }
    }
    
    
}

extension ExplorerViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        let info = list[indexPath.row]
        cell.labelView.text = info.label
        cell.imageView.image = UIImage(named: info.image!)
        
        return cell
    }
    
    
}

extension ExplorerViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tablecelIdentifier , for: indexPath) as! TableViewCell
        let item = tableList[indexPath.row]
        cell.tableImageView.image = UIImage(named: item.imageName!)
        cell.titleLabel.text = item.title!
        cell.alterTitle.text = "\(item.desc!)\n\(item.date!)"
        cell.starredLabel.text = item.starred!
        cell.priceLabel.text = item.price!
        cell.priceNightLabel.text = item.nightPrice!
        cell.setupCellUI()
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 420
    }
}
