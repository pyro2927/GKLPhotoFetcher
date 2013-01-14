//
//  GKLViewController.m
//  PhotoFetcher
//
//  Created by Joseph Pintozzi on 1/14/13.
//  Copyright (c) 2013 GoKart Labs. All rights reserved.
//

#import "GKLViewController.h"

@interface GKLViewController ()

@end

@implementation GKLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)show:(id)sender{
    [GKLPhotoFetcher fetchPhotoWithDelegate:self andNavigationController:self.navigationController];
}

- (void)photoFetcher:(id)fetcher returnedImage:(UIImage*)image{
    [imageView setImage:image];
}

@end
