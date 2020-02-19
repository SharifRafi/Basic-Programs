import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageCollectionView: UICollectionView!
    
    var collectData = [OnlineImageModel]()
    
    
    var images: [UIImage] = [
        UIImage(named: "File 1.jpg")!,
        UIImage(named: "File 2.jpg")!,
        UIImage(named: "File 3.jpg")!,
        UIImage(named: "File 4.jpg")!,
        UIImage(named: "File 5.jpg")!,
        UIImage(named: "File 6.jpg")!,
        UIImage(named: "File 7.jpg")!,
        UIImage(named: "File 8.jpg")!,
        UIImage(named: "File 9.jpg")!,
        UIImage(named: "File 11.jpg")!,
        UIImage(named: "File 12.jpg")!,
        UIImage(named: "File 13.jpg")!,
        UIImage(named: "File 14.jpg")!,
        UIImage(named: "File 15.jpg")!,
        UIImage(named: "File 16.jpg")!,
        UIImage(named: "File 17.jpg")!,
        UIImage(named: "File 18.jpg")!,
        UIImage(named: "File 20.jpg")!,
        UIImage(named: "File 21.jpg")!,
        UIImage(named: "File 22.jpg")!,
        UIImage(named: "File 23.jpg")!,
        UIImage(named: "File 24.jpg")!,
        UIImage(named: "File 25.jpg")!,
        UIImage(named: "File 27.jpg")!,
        UIImage(named: "File 28.jpg")!,
        UIImage(named: "File 29.jpg")!
     ]
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal

        //Provide Width and Height According to your need
        let cellWidth = UIScreen.main.bounds.width / 10
        let cellHeight = UIScreen.main.bounds.height / 10
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)

        //You can also provide estimated Height and Width
        layout.estimatedItemSize = CGSize(width: cellWidth, height: cellHeight)

        //For Setting the Spacing between cells
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0

        return UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageCollectionView.delegate = self
        imageCollectionView.dataSource = self
        
        tableView.dataSource = self
        tableView.delegate = self
        getProfileData()
        
//        if let flowLayout = imageCollectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
//          flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
//        }
    }
    
//    func getProfileData(){
//        print("my self")
//        let session = URLSession.shared
//        let url = URL(string: "https://api.myjson.com/bins/rak70")!
//        let task = session.dataTask(with: url, completionHandler: { data, response, error in
//            // Check the response
//            print(response)
//
//            // Check if an error occured
//            if error != nil {
//                // HERE you can manage the error
//                print(error)
//                return
//            }
//            // Serialize the data into an object
//            do {
//                let json = try JSONDecoder().decode([OnlineImageModel].self, from: data! )
//                    //try JSONSerialization.jsonObject(with: data!, options: [])
//                print(json)
//            } catch {
//                print("Error during JSON serialization: \(error.localizedDescription)")
//            }
//
//        })
//        task.resume()
//    }
    
    public func getProfileData() {
        //var collectData: [String] = [String]()
        guard let url = URL(string: "https://api.myjson.com/bins/rak70") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        URLSession.shared.dataTask(with: request) { (data, response, error) in

            if let data = data {
                do {
                    let responseModel = try JSONDecoder().decode([OnlineImageModel].self, from: data)
                    
                    for response in responseModel{
                        //print(response)
                        self.collectData.append(response)
                        
                    }
                    self.tableView.reloadData()
                }
                catch {
                    print(error.localizedDescription)
                    return
                }
            }
        } .resume()
    }
    
    private func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: 414.0, height: 200.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CollectionViewCell = imageCollectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! CollectionViewCell
            
          cell.image.image = images[indexPath.row]

          return cell
    }
    
    //TableView
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(collectData.count)
        return collectData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        cell.configuredatafunction(with: collectData[indexPath.row])
        
//        let imgString = collectData[indexPath.row].image!
//        print("check image")
//
//        let imgUrl = URL(string: imgString)!
//        ImageService.downloadImage(url: imgUrl) { (img) in
//            cell.imagee.image = img
//        }

        return cell
    }

//    let url = URL(string: "http://www.stackoverflow.com")
//    let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
//        let jsonDecoder = JSONDecoder()
//        let responseModel = try jsonDecoder.decode(Json4Swift_Base.self, from: data!)
//
//    }
//    task.resume()

}

