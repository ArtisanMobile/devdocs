---
layout: docs
title: "Callbacks"
author: "Artisan"
category: dev/ios
description: "Callbacks for the Artisan iOS SDK"
---

# Callbacks

If you would like to hold up your app and wait for that first playlist to be downloaded, or desire to change something in your app immediately when a Power Hook value changes, you can leverage our callback functionality.

<ul>
  <li><a href="#playlist">Playlist Callbacks</a></li>
  <li><a href="#power-hook">Power Hook Callbacks</a></li>
</ul>

<div id="playlist"></div>

## Playlist Callbacks

When your app is started Artisan will fetch the latest changes from the Artisan Service. If you would like to hold up your app and wait for that first playlist to be downloaded, you can use the ARManager **onFirstPlaylistDownloaded:withTimeout:** method.

This call is non-blocking so code execution will continue immediately to the next line of code.

Here is an example where I wait for no more than 3 seconds for the first playlist to download:

{% highlight objective-c %}
// Objective-C

- (void)viewDidLoad {
    waitingViewController = [[MYSampleWaitingViewController alloc] init];

    [self presentViewController:waitingViewController animated:NO completion:nil];

    __block MYSampleHomeScreenViewController *_self = self;

    [ARManager onFirstPlaylistDownloaded:^{
        // this will be executed when the first playlist is downloaded or after 3 seconds, whichever is first.
        [_self hideWaitingViewController];
    } withTimeout:3];
}
{% endhighlight %}

{% highlight swift %}
// Swift

override func viewDidLoad() {
    super.viewDidLoad()

    let waitingViewController = MYSampleWaitingViewController()

    self.presentViewController(waitingViewController, animated:false, completion:nil)

    let _self: MYSampleHomeScreenViewController = self

    ARManager.onFirstPlaylistDownloaded({
        // This will be executed when the first playlist is donwloaded or after 3 seconds, whichever is first
        _self.hideWaitingViewController()
    }, withTimeout:3)
}
{% endhighlight %}

<div class="note note-hint">
<p><strong>FIRST VIEW CONTROLLERS:</strong> If you are registering a callback from the viewDidLoad of your first view controller, make sure that your call to start Artisan happens <strong>before</strong> the call to makeKeyAndVisible for that first view controller's window. Otherwise your callback won't actually be registered.</p>

{% highlight objective-c %}
- (BOOL)application:(UIApplication *)application
        didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

  // This controller has the callbacks registered in viewDidLoad
  self.rootViewController = [[ExampleRootViewController alloc] init];
  self.window.rootViewController = self.rootViewController;

  // Start Artisan *before* making the window visible
  // So that callback registerations in viewDidLoad will be successful
  [ARManager startWithAppId:@"YOUR_APP_ID"];

  [self.window makeKeyAndVisible];

  return YES;
}
{% endhighlight %}
</div>


<div class="note note-hint">
  <p><strong>A NOTE ON THREADING:</strong> The thread calling the block of code is guaranteed to be the main thread.  If the code inside of the block requires executing on a background thread you will need to implement this logic.</p>
  <p>If the first playlist has already been downloaded when this call is made this becomes a blocking call and the block of code is executed immediately.</p>
</div>


<div id="power-hook"></div>

##Power Hook Callbacks

When new Power Hook values come down from Artisan you might want the option to change something in your app immediately rather than waiting for the view controller to disappear and appear again.

You can register callbacks for when an individual power hook changes or when any power hook changes. This is typically done in one of your view controllers.

### When individual Power Hook Values change
For individual Power Hook values you can get a reference to an ARPowerHookVariable to register a callback for when the value is updated.

{% highlight objective-c %}
// Objective-C

@interface MYSampleViewController ()
{
  ARPowerHookVariable *marketingMessageVariable;
}
@end

@implementation MYSampleViewController

- (void)viewDidLoad {
  // get a reference to the ARPowerHookVariable
  marketingMessageVariable = [ARPowerHookManager getPowerHookVariable:@"marketingMessage"];
}
{% endhighlight %}

{% highlight swift %}
// Swift

class MYSampleViewController {
    let marketingMessageVariable: ARPowerHookVariable

    override func viewDidLoad() {
        // Get a reference to the ARPowerHookVariable
        marketingMessageVariable = ARPowerHookManager.getPowerHookVariable("marketingMessage")
    }
}
{% endhighlight %}

Here is an example of registering a callback with the "marketingMessage" Power Hook value changes.

{% highlight objective-c %}
// Objective-C

- (void)viewWillAppear:(BOOL)animated {
    [marketingMessageVariable onPowerHookChanged:^(BOOL previewMode) {
      if (previewMode) {
        // you might only want to change a value on the screen if you are in Artisan previewMode
        NSLog(@"In Preview Mode! Updated Marketing Message is: %@", marketingMessageVariable.value);
      } else {
        NSLog(@"Updated Marketing Message is: %@", marketingMessageVariable.value);
      }
    }];
}
{% endhighlight %}

{% highlight swift %}
// Swift

override func viewWillAppear(animated:Bool) {
    marketingMessageVariable.onPowerHookChanged({(previewMode:Bool) in
        if previewMode {
            // you might only want to change a value on the screen if you are in Artisan previewMode
            println("In Preview Mode! Updated Marketing Message is: \\(marketingMessageVariable.value)")
        } else {
            println("Updated Marketing Message is: \\(marketingMessageVariable.value)")
        }
    })
}
{% endhighlight %}

Artisan provides a previewMode flag to tell you if you are currently in <a href="#preview-mode">Artisan Preview Mode</a>, previewing unpublished changes for your App. For example, you may want to only change text on the screen immediately if you are in previewMode. This will make it easier to preview Power Hook values in your app while you are considering changes in Artisan Tools.

<div class="note note-hint">
  <p><strong>A NOTE ON THREADING:</strong> The thread calling the block of code is guaranteed to be the main thread.  If the code inside of the block requires executing on a background thread you will need to implement this logic.</p>
</div>

To avoid memory leaks, it is important that you also unregister your callback in the parallel method to the one in which you registered it. For example, if you registered in **viewWillAppear** it is best to unregister in **viewWillDisappear**.

{% highlight objective-c %}
// Objective-C

- (void) viewWillDisappear:(BOOL)animated {
  [marketingMessageVariable unregisterPowerHookChanged];
}
{% endhighlight %}

{% highlight swift %}
// Swift

override func viewWillDisappear(animated:Bool) {
    marketingMessageVariable.unregisterPowerHookChanged()
}
{% endhighlight %}

### When any Power Hook Value changes

If there are many power hooks that are used on an individual screen it may make sense to add a callback for when any power hook changes. Here is an example:

Just as with the individual power hook value callbacks you have the previewMode flag to tell you if you are currently in <a href="/dev/ios/power-hooks/#preview-mode">Artisan Preview Mode</a>, previewing unpublished changes for your App.
{% highlight objective-c %}
// Objective-C

[ARPowerHookManager onPowerHooksChanged:^(BOOL previewMode) {
  if (previewMode) {
    // you might only want to change a value on the screen if you are in Artisan previewMode
    NSLog(@"In Preview Mode! Power Hooks Changed!");
  } else {
    NSLog(@"Power Hooks Changed!");
  }
}];
{% endhighlight %}

{% highlight swift %}
// Swift

ARPowerHookManager.onPowerHooksChanged({(previewMode:Bool) in
    if previewMode {
        // you might only want to change a value on the screen if you are in Artisan previewMode
        println("In Preview Mode! Power Hooks Changed!")
    } else {
        println("Power Hooks Changed!")
    }
})
{% endhighlight %}

<div class="note note-hint">
  <p><strong>A NOTE ON THREADING:</strong> The thread calling the block of code is guaranteed to be the main thread.  If the code inside of the block requires executing on a background thread you will need to implement this logic.</p>
</div>
