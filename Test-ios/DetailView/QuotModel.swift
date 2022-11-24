//
//  QuotModel.swift
//  Test-ios
//
//  Created by Daniele Tassone on 24/11/2022.
//

import Foundation



// MARK: - QuotModelElement
struct QuotModelElement: Hashable, Codable {
    let quoteID: Int
    let quote, author, series: String
    
    enum CodingKeys: String, CodingKey {
        case quoteID = "quote_id"
        case quote, author, series
    }
}

typealias QuotModel = [QuotModelElement]
