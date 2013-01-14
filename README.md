<a href="http://gokartlabs.com"><img src="https://raw.github.com/pyro2927/GKLImages/master/icon_xtra_small.png"></a>PhotoFetcher
===============

Quick and easy way to get photos from iOS devices!

## Device Detection
GKLPhotoFetcher automatically detects if the current device has a camera available or not.  If a camera is available, a UIActionSheet will be presented to the user to allow them to pick which photo source they want to use.  If a camera is not available, they will be brought directly into their Photo Library.

## Implementation
Call the PhotoFetcher like this:

	[GKLPhotoFetcher fetchPhotoWithDelegate:self andNavigationController:self.navigationController];
	
And make sure to receive the delegate callback like this:

	- (void)photoFetcher:(id)fetcher returnedImage:(UIImage*)image{
 	   [imageView setImage:image];
	}
	
That's it!