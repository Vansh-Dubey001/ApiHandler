//
//  ViewController.swift
//  basic app
//
//  Created by Vansh Dubey on 05/06/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var myCollectionView: UICollectionView!
    @IBOutlet weak var display: UITextView!
    var arr:[DataModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.\
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        
        let apidata = FetchData()
        apidata.fetchData { (res) in
            switch res{
            case .success( let names):
                names.forEach({(pokemon) in
                    self.arr.append(pokemon)
                })
            case .failure(let Error):
                print("Error fetching result \(Error)")
            }
            DispatchQueue.main.async {
                print(self.arr)
            }
        }
        
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.backgroundColor = .cyan
        cell.nameLbl.text = self.arr[indexPath.row].name
        cell.urlLbl.text = self.arr[indexPath.row].url
        return cell
    }
    
    
}
