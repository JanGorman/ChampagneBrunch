//
//  Copyright © 2017 Schnaub. All rights reserved.
//

import XCTest
import ChampagneBrunch

class ChampagneBrunchTests: XCTestCase {

  func testFeature() {
    _ = Feature(collection: "Features", group: "General", name: "Boolean", value: true)
    _ = Feature(collection: "Features", group: "General", name: "UI Color", value: CodableUIColor(.blue))
    _ = Feature(collection: "Features", group: "General", name: "Boolean", value: CGFloat(100))
  }
  
}
