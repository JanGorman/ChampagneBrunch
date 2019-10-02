//
//  Copyright © 2017 Schnaub. All rights reserved.
//

import UIKit

public struct CodableUIColor: Codable {

  private let box: CodableBox<UIColor>

  public var color: UIColor? {
    box.value
  }

  public init(_ color: UIColor) {
    self.box = CodableBox(color)
  }

  public init(from decoder: Decoder) throws {
    box = try CodableBox<UIColor>(from: decoder)
  }

  public func encode(to encoder: Encoder) throws {
    try box.encode(to: encoder)
  }

}

public struct CodableBox<T: NSCoding>: Codable {

  let value: T?

  public init(_ value: T) {
    self.value = value
  }

  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    let data = try container.decode(Data.self, forKey: .value)
    value = NSKeyedUnarchiver.unarchiveObject(with: data) as? T
  }

  public func encode(to encoder: Encoder) throws {
    guard let value = value else { return }
    let data = NSKeyedArchiver.archivedData(withRootObject: value)
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(data, forKey: .value)
  }

  enum CodingKeys: String, CodingKey {
    case value
  }

}
