import UIKit

class TableViewCell: UITableViewCell {
  
    @IBOutlet weak var imagee: UIImageView!
    @IBOutlet weak var tagLabel: UILabel!
     
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
    
    public func configuredatafunction(with json:OnlineImageModel)
    {
        
        print(json)
        tagLabel.text = json.name ?? ""
        
        imagee.image = UIImage(contentsOfFile: json.image ?? "")
    }
}
    
