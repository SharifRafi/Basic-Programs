/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com
For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import UIKit
struct OnlineImageModel : Codable {
	let pk : Int?
    let name : String?
    let image : String?

    enum CodingKeys: String, CodingKey {

        case pk = "pk"
        case name = "name"
        case image = "image"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        pk = try values.decodeIfPresent(Int.self, forKey: .pk)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        image = try values.decodeIfPresent(String.self, forKey: .image)
    }

}
