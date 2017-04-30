# AKGPushAnimator
Easily Push and Pop viewcontroller with segue like Instagram App with Interaction written in pure Swift 3


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
#### Customise Animation with constants

AKGPushAnimator has constants file to easily change animation types:

```swift
struct Common {
    static let duration = 0.27;
    static let dismissPosition : CGFloat = -50;
}

struct Push {
    static let animateOption = UIViewAnimationOptions.curveEaseOut

}

struct Pop {
    static let animateOption = UIViewAnimationOptions.curveEaseInOut
}

```

## Author

Ahmet Kazım Günay, ahmetkgunay@gmail.com

## License

AKGPushAnimator is available under the MIT license. See the LICENSE file for more info.

