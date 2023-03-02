//
//  MovieService.swift
//  TVOS+SwiftUI+Combine
//
//  Created by KOVIGROUP on 02/03/2023.
//

import Foundation

struct ProductionCompanies : Codable {
    let id : Int?
    let logo_path : String?
    let name : String?
    let origin_country : String?
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case logo_path = "logo_path"
        case name = "name"
        case origin_country = "origin_country"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        logo_path = try values.decodeIfPresent(String.self, forKey: .logo_path)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        origin_country = try values.decodeIfPresent(String.self, forKey: .origin_country)
    }
    
}
