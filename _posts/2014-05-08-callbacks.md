---
layout: docs
title: "Callbacks"
author: "Artisan"
category: dev/android
description: "Callbacks for the Artisan Android SDK"
---

# Callbacks

If you would like to hold up your app and wait for that first playlist to be downloaded, or desire to change something in your app immediately, you can leverage our callback functionality.

<ul>
  <li><a href="#playlist">Playlist Callbacks</a></li>
  <li><a href="#power-hook">Power Hook Callbacks</a></li>
</ul>

<div id="playlist"></div>

## Playlist Callbacks

When your app is started Artisan will fetch the latest changes from the Artisan Service. If you would like to hold up your app and wait for that first playlist to be downloaded, you can use the ArtisanManager **onFirstPlaylistDownloaded** method.

This call is non-blocking so code execution will continue immediately to the next line of code.

Here is an example where I wait for no more than 3 seconds for the first playlist to download and then transition to my MainActivity:

{% highlight java %}
public class SplashActivity extends ArtisanActivity {

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    setContentView(R.layout.activity_splash);

    ArtisanManager.onFirstPlaylistDownloaded(this, new ArtisanManagerCallback() {
      @Override
      public void execute() {
        Intent nextActivityIntent = new Intent(SplashActivity.this, MainActivity.class);
        startActivity(nextActivityIntent);
        finish();
      }
    }, 3000);
  }
}
{% endhighlight %}

<p>You can only register one onFirstPlaylistDownloaded callback, if you register new blocks they will replace the previous block.</p>

<p>The block will only be executed once per app process lifetime. So, if you background and foreground the app and this callback is re-registered, it won't execute again. Only if the app process is killed will this block be eligible to run again.</p>

<div class="note note-hint">
  <p><strong>A NOTE ON THREADING:</strong> The thread calling the block of code is guaranteed to be the main thread.  If the code inside of the block requires executing on a background thread you will need to implement this logic.</p>
  <p>If the first playlist has already been downloaded when this call is made this becomes a blocking call and the block of code is executed immediately.</p>  
</div>

You can check if the first Artisan playlist has been downloaded in this app process with ArtisanManager.isFirstPlaylistDownloaded.

{% highlight java %}
if (ArtisanManager.isFirstPlaylistDownloaded()) {
  Intent nextActivityIntent = new Intent(this, MainActivity.class);
  startActivity(nextActivityIntent);
  finish();
}
{% endhighlight %}

If this is true when you first register your callback with onFirstPlaylistDownloaded(Activity, ArtisanManagerCallback) then your callback will execute immediately.

<div id="power-hook"></div>

##Power Hook Callbacks

When new Power Hook values come down from Artisan you might want the option to change something in your app immediately rather than waiting for the Activity to disappear and appear again.

You can register callbacks for when an individual power hook changes or when any power hook changes. This is typically done in one of your Activities.

### When individual Power Hook Values change

For individual Power Hook values you can get a reference to an PowerHookVariable to register a callback for when the value is updated.

{% highlight java %}
public class MainActivity extends ArtisanActivity {

	private PowerHookVariable startScreenTextHook;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);

		startScreenTextHook = PowerHookManager.getPowerHookVariable("startScreenText");
	}

	@Override
	protected void onStart() {
		super.onStart();

		TextView startScreenTextView = (TextView) findViewById(R.id.activity_text);
		startScreenTextView.setText(startScreenTextHook.getValue());

		startScreenTextHook.onPowerHookChanged(this, new PowerHookCallback() {
			@Override
			public void execute(boolean previewMode) {
				TextView startScreenTextView = (TextView) MainActivity.this.findViewById(R.id.activity_text);
				startScreenTextView.setText(startScreenTextHook.getValue());
			}
		});
	}
}
{% endhighlight %}

<div class="note note-hint">
  <p><strong>A NOTE ON THREADING:</strong> The thread calling the block of code is guaranteed to be the main thread.  If the code inside of the block requires executing on a background thread you will need to implement this logic.</p>
</div>

Artisan provides a previewMode flag to tell you if you are currently in <a href="/dev/android/power-hooks/#preview-mode">Artisan Preview Mode</a>, previewing unpublished changes for your App. For example, you may want to only change text on the screen immediately if you are in previewMode. This will make it easier to preview Power Hook values in your app while you are considering changes in Artisan Tools.

<div class="note note-important">
  <p>Preview Mode is not yet supported for the Android SDK, but it is coming soon!</p>
</div>

#### Unregister your Callback

To avoid memory leaks, it is important that you also unregister your callback in the parallel method to the one in which you registered it.

This method should be called in onPause, onStop or onDestroy to remove the callback that you registered for this Power Hook variable. The method that you call this in should be the parallel to the method where the callback was registered, so if you registered in onStart then you should unregister in onStop.

You may call this sooner if you wish to remove your callback.

{% highlight java %}
@Override
protected void onStop() {
	super.onStop();
	startScreenTextHook.unregisterPowerHookChanged();
}
{% endhighlight %}

### When any Power Hook Value changes

If there are many power hooks that are used on an individual screen it may make sense to add a callback for when any power hook changes. Here is an example:

Just as with the individual power hook value callbacks you have the previewMode flag to tell you if you are currently in <a href="#preview-mode">Artisan Preview Mode</a>, previewing unpublished changes for your App.
{% highlight java %}
@Override
protected void onCreate(Bundle savedInstanceState) {
	super.onCreate(savedInstanceState);
	setContentView(R.layout.activity_main);

	PowerHookManager.onPowerHooksChanged(this, new PowerHookCallback() {
		@Override
		public void execute(boolean previewMode) {
			Toast.makeText(MainActivity.this, "Power hooks changed!", Toast.LENGTH_SHORT).show();
		}
	});
}
{% endhighlight %}

<div class="note note-hint">
  <p><strong>A NOTE ON THREADING:</strong> The thread calling the block of code is guaranteed to be the main thread.  If the code inside of the block requires executing on a background thread you will need to implement this logic.</p>
</div>
