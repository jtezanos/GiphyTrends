# GiphyTrends
View trending GIFs from Giphy - Search for GIFs too! Project was built with a bit of MVVM and some functional Swift.

<iframe src='https://gfycat.com/ifr/BossySpitefulBrahmancow' frameborder='0' scrolling='no' width='640' height='1142.8571428571427' allowfullscreen></iframe>

## Installation
- Intall [Cocoapods](http://guides.cocoapods.org/using/getting-started.html#installation).
- cd to directory and create Podfile.
```swift
pod install
```
```swift
open Podfile
```
- Add the following to Podfile
  ```swift
  source 'https://github.com/CocoaPods/Specs.git'
  platform :ios, '8.0'
  use_frameworks!

  pod 'Alamofire', '~> 3.0'
  pod 'Gifu'
  pod 'AASquaresLoading'
  pod 'SwiftyUserDefaults'
  ```
- Save and install pods
```swift
pod install
```

## Features
- See Trending GIFs from Giphy
- Search for GIFs
- Family Friendly search will filter out pg-13 and r rated GIFs (Can change via settings)
- If a GIF has ever trended, it will be denoted with a star

## What's Next
- Unit Tests
- Resize cells according to GIF dimensions
- Tap on cell to display enlarged GIF
