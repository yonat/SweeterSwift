# SweeterSwift
<img align="right" src="Screenshots/SweeterSwift.png">

[![Swift Version][swift-image]][swift-url]
[![Build Status][travis-image]][travis-url]
[![License][license-image]][license-url]
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/SweeterSwift.svg)](https://img.shields.io/cocoapods/v/SweeterSwift.svg)  
[![Platform](https://img.shields.io/cocoapods/p/SweeterSwift.svg?style=flat)](http://cocoapods.org/pods/SweeterSwift)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

Extensions and syntactic sugar to enrich the Swift standard library, iOS frameworks, and [SwifterSwift](https://github.com/SwifterSwift/SwifterSwift).

## Installation

### CocoaPods:

```ruby
pod 'SweeterSwift'
```

### Swift Package Manager:

```swift
dependencies: [
    .package(url: "https://github.com/yonat/SweeterSwift", from: "1.1.3")
]
```

## Usage

* [Auto Layout](#auto-layout)
* [Bundle](#bundle)
* [Codable](#codable)
* [DateFormatter](#dateformatter)
* [NotificationCenter](#notificationcenter)
* [NSAttributedString](#nsattributedstring)
* [NSManagedObjectContext](#nsmanagedobjectcontext)
* [String](#string)
* [Swift Standard Library](#swift-standard-library)
* [TimeInterval](#timeinterval)
* [UIApplication](#uiapplication)
* [UILabel / UITextView](#uilabel-uitextview)
* [UIStackView](#uistackview)
* [UIView](#uiview)


### Auto Layout

Add button at the center of view:

```swift
view.addConstrainedSubview(button, constrain: .centerX, .centerY)
```

Put label over textField:

```swift
view.constrain(label, at: .leading, to: textField)
view.constrain(textField, at: .top, to: label, at: .bottom, diff: 8)
```

Add child view controller covering all but the bottom margin:

```swift
addConstrainedChild(vc, constrain: .bottomMargin, .top, .left, .right)
```

### Bundle

App name with reasonable fallback to process name:

```swift
let appName = Bundle.main.name
```

App info string with name, version, and build number:

```swift
let appInfo = Bundle.main.infoString // "MyApp 1.0 #42"
```

### Codable

Create object from a dictionary:

```swift
let decodableObject = MyDecodableClass(dictionary: aDictionary)
```

Export object to a dictionary:

```swift
let aDictionary = encodableObject.dictionary
```

### DateFormatter

Create with format:

```swift
let dateFormatter = DateFormatter(format: "cccc, MMMM dd")
```

### NotificationCenter

Post a local notification using `NotificationCenter.default`:

```swift
notify(notificationName, userInfo: infoDictionary)
```

Respond to a local notification from `NotificationCenter.default`:

```swift
observeNotification(notificationName, selector: #selector(someFunc))
```

### NSAttributedString

Create from HTML:

```swift
let attributedString = NSAttributedString(htmlString: "Hello, <b>world</b>!")
```

Turn a substring into a link:

```swift
mutableAttributedString.link(anchorText: "Hello", url: "https://ootips.org")
```

### NSManagedObjectContext

Dump contents to console for debugging:

```swift
managedObjectContext.printAllObjects()
```

Create a copy of the store for backup or for using later as initial setup:

```swift
managedObjectContext.backupStore()
```

### String

Separate CamelCase into capitalized words:

```swift
let words = "winterIsComing".unCamelCased // "Winter Is Coming"
```

Change CamelCase into snake_case:

```swift
let key = "winterIsComing".camelToSnakeCased // "winter_is_coming"
```

### Swift Standard Library

Index of current enum case in `allCases`:

```swift
let index = MyEnum.someCase.index
```

Unwrap collection, shorthand for `compactMap { $0 }`:

```swift
let nonOptionals = optionalsCollection.compact
```

Avoid retain cycles when passing a member function as an @escaping closure:

```swift
var closure = weak(self, in: MyClass.someFunction)
```

### TimeInterval

Standard time intervals:

```swift
let myInterval: TimeInterval = .year + .month + .week + .day + .hour + .minute
```

### UIApplication

Find the top-most view controller:

```swift
let topVC = UIApplication.topViewController()
```

Present modal over the top view controller:

```swift
UIApplication.present(modalVC)
```

### UILabel / UITextView

Create a label with links by using a `UITextView` to auto-detect links and simulate `UILabel` appearance:

```swift
let hyperlinkedLabel = UITextView(simulatedLabelWithLinksInText: "More at https://ootips.org")
```

### UIStackView

Remove an arranged subview from the view hierarchy, not just the stack arrangement:

```swift
stackView.removeArrangedSubviewCompletely(subview)
```

Remove all arranged subviews from the view hierarchy, not just the stack arrangement:

```swift
stackView.removeAllArrangedSubviewsCompletely()
```

### UIView

Search the view hierarchy recursively for a subview that meets a condition:

```swift
let blueSubview = view.viewInHierarchy(where { $0.backgroundColor == .blue })
```

Search the view hierarchy recursively for a subview with a specific class:

```swift
let button = view.viewWithClass(UIButton.self)
```


## Meta

[@yonatsharon](https://twitter.com/yonatsharon)

[https://github.com/yonat/SweeterSwift](https://github.com/yonat/SweeterSwift)

[swift-image]:https://img.shields.io/badge/swift-5.0-orange.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: LICENSE.txt
[travis-image]: https://img.shields.io/travis/dbader/node-datadog-metrics/master.svg?style=flat-square
[travis-url]: https://travis-ci.org/dbader/node-datadog-metrics
