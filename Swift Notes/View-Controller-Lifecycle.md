
## View Controller Lifecycle

**init(coder:)**

-   When it is called / When it is used :
    
    -   View controller are usually created from storyboards. When this is the case,init(coder:) is the initializer that gets called and you have to override.
    -   It provides an NSCoder instance as a parameter, which you need only if you are using iOS serialization APIs. This is not used often, so you can ignore the parameter. If you are curious, serialization transforms an object in a byte stream that you can save on disk or send over the network.
-   Application :
    
    -   During the initalization phase of a view controller, you usually allocate the resources that the view controller will need during its lifetime. These include model objects or other auxiliary controllers, like network controllers.
    -   Previous view controllers might also pass these objects to the current one, so you do not always need to instantiate them in every view controller.
-   Things to take care of :
    
    -   Beware that the view of the view controller has still not been instantiated at this point. If you try to access it through the view property of UIViewController, the loadView() method will be called. This might create unexpected behavior and bugs, so it’s safer not to access the view until later in the lifecycle.

**init(nibName:bundle:)**

-   When it is called / When it is used :
    -   Sometimes you might decide to put your view controller’s interface in a separate nib file instead of a storyboard. This might happen, for example, to work in a larger team where different members need to be change view controller interfaces without affecting the work of others. You also might have a project that was created when storyboards did not exist yet, so every view controller had its own nib file.Keep in mind that if your main storyboard starts getting too big, you can split it into more storyboards. You do not need to move every view controller in a separate nib file.
    -   If you create a view controller from a nib file, this initializer is called instead of init(coder:).
    
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

> **NOTE :** In iOS 6 and later, viewDidUnload method is deprecated since views are no longer  purged under low-memory conditions.
