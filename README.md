# AKGPushAnimator
<p align="left">
<a href="https://swift.org">
<img src="http://img.shields.io/badge/Swift-4.0-brightgreen.svg" alt="Language">
</a>  <a href="https://github.com/ahmetkgunay/NetworkLayer/blob/master/LICENSE">
<img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="MIT License">
</a>
<a href="https://github.com/Carthage/Carthage">
<img src="https://img.shields.io/badge/carthage-compatible-4BC51D.svg?style=flat" alt="Carthage" />
</a>
<a href="https://twitter.com/ahmtgny">
<img src="https://img.shields.io/badge/contact-@ahmtgny-blue.svg?style=flat" alt="Twitter: @ahmtgny" />
</a>
<a>
<img src="https://img.shields.io/gemnasium/mathiasbynens/he.svg?style=flat">
</a>
</p>

Easily Push and Pop viewcontroller like Instagram App with Interaction written in pure Swift 4

![Anim](https://github.com/ahmetkgunay/AKGPushAnimator/blob/master/AKGPushAnimator.gif)

## Import Library To Your Class

If you are using Carthage to install AKGPushAnimator, then you need to import AKGPushAnimatorKit where you want to use.
Because "Carthage" needs Embedded Framework to install libraries, and AKGPushAnimatorKit is the embedded library name of this project.

If you are using Cocoapods to install AKGPushAnimator, then you need to import AKGPushAnimator where you want to use it.

## Usage

Usage is simple with creating any BaseViewController and implement UINavigationControllerDelegate 


```swift

class BaseViewController: UIViewController, UINavigationControllerDelegate {

    let pushAnimator = AKGPushAnimator()
    let interactionAnimator = AKGInteractionAnimator()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {

        if operation == .push {
            interactionAnimator.attachToViewController(toVC)
        }
        pushAnimator.isReverseTransition = operation == .pop
        return pushAnimator
    }

    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {

        return interactionAnimator.transitionInProgress ? interactionAnimator : nil
    }
}
```

After that, create any ViewController inheritted from BaseViewController and set navigationcontroller delegate before pushing viewcontroller (in prepare for segue for best)

And Thats all! Now you have interactive push and pop animation like Instagram App.

```swift

class FirstViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        pushAnimator.delegate = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSecond" {
            navigationController?.delegate = self
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

```

#### Delegation Pattern

```swift

extension FirstViewController: AKGPushAnimatorDelegate {

    func beganTransition() {
        print("began transition")
    }

    func cancelledTransition() {
        print("cancelled transition")
    }

    func finishedTransition() {
        print("finished transition")
    }
}

```

#### Customise Animation with constants

AKGPushAnimator has constants file to easily change animation types:

```swift
struct Common {
    static let duration = 0.27;
    static let dismissPosition : CGFloat = -50;
    static let shadowOpacity : Float = 1
    static let shadowColor : UIColor = .black
}

struct Push {
    static let animateOption = UIViewAnimationOptions.curveEaseOut

}

struct Pop {
    static let animateOption = UIViewAnimationOptions.curveEaseInOut
}

```
## Installation

There are three ways to use AKGPushAnimator in your project:
- using CocoaPods
- using Carthage
- by cloning the project into your repository

### Installation with CocoaPods

[CocoaPods](http://cocoapods.org/) is a dependency manager for Swift and Objective-C, which automates and simplifies the process of using 3rd-party libraries in your projects. See the [Get Started](http://cocoapods.org/#get_started) section for more details.

#### Podfile
```ruby
platform :ios, '8.0'
use_frameworks!
pod 'AKGPushAnimator', '~> 1.0.6'
```

### Installation with Carthage

[Carthage](https://github.com/Carthage/Carthage) is a lightweight dependency manager for Swift and Objective-C. It leverages CocoaTouch modules and is less invasive than CocoaPods.

To install with carthage, follow the instruction on [Carthage](https://github.com/Carthage/Carthage)

#### Cartfile
```
github "ahmetkgunay/AKGPushAnimator" ~> 1.0.6
```

## Author

Ahmet Kazım Günay, ahmetkgunay@gmail.com

## License

AKGPushAnimator is available under the MIT license. See the LICENSE file for more info.

