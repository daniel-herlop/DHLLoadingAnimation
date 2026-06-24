# DHLLoadingAnimation
Custom loading animation view.

![Swift](https://img.shields.io/badge/Swift-5.0-orange)
![Platform](https://img.shields.io/badge/iOS-14%2B-blue)

## Preview
![Screenshot](docs/screenshot1.png)

## Installation

### CocoaPods

```ruby
pod 'DHLLoadingAnimation'
```

## Quick Start

### UIKit

If you have a "custom_lottie.json" on your project. That animation will be used.

```swift
DHLLoadingAnimation.widthMultiplier = 0.5

self.showLoadingAnimation(show: true)

self.showLoadingAnimation(show: false)
```
