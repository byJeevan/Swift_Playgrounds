
## View Controller Lifecycle
**1. loadView :** When view created programatically, then the first method which gets called is loadView. It's good not to do anything on this method - if view controller instantiated from `.xib` or `.storyboard`. 
- When it will call ?
A. UIViewController will call loadView method if its UIView instance is requested by someone and it’s currently nil. 
B. Override when we need to load our custom view at some point of execution. 

**2. viewDidLoad :** Called When all the view are loaded.

**3. viewWillAppear :** Called every time before the view are visible to and before any animation are configured.

**4. viewWillLayoutSubviews :** When a view’s bounds change, the view adjusts the position of its subviews.

**5. viewDidLayoutSubviews :** Called after the viewController has been adjust to its subview following a change on its bound.

**6. viewDidAppear :** Called after the view present on the screen.

**7. viewWillDisappear :** Called before the view are remove from the view hierarchy.The View are Still on view hierarchy but not removed yet.

**8. viewDidDisappear :**
This method is called after the VC’s view has been removed from the view hierarchy. Use this method to stop listening for notifications or device sensors

**9. deinit :**
Before a view controller is removed from memory, it gets deinitialized.
