//
//  GKLViewController.h
//  PhotoFetcher
//
//  Created by Joseph Pintozzi on 1/14/13.
//  Copyright (c) 2013 GoKart Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GKLPhotoFetcher.h"

@interface GKLViewController : UIViewController<GKLPhotoFetcherDelegate>{
    IBOutlet UIImageView *imageView;
}
-(IBAction)show:(id)sender;
@end
