//
//  Copyright © 2017 Schnaub. All rights reserved.
//

import Foundation

//public protocol StringRepresentable {
//  func toString() -> String
//}
//
//extension RawRepresentable where Self: StringRepresentable {
//  func toString() -> String {
//    return "\(rawValue)"
//  }
//}
//
//extension String: StringRepresentable {
//  public func toString() -> String {
//    return self
//  }
//}
//
//public typealias FeatureDescription = StringRepresentable & Codable

public struct Feature<T: Codable>: Codable {
  let collection: String
  let group: String
  let name: String
  let value: T
  
  public init(collection: String, group: String, name: String, value: T) {
    self.collection = collection
    self.group = group
    self.name = name
    self.value = value
  }
}
