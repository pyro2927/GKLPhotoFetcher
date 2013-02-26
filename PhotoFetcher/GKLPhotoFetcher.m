//
//  GKLPhotoFetcher.m
//  PhotoFetcher
//
//  Created by Joseph Pintozzi on 1/14/13.
//  Copyright (c) 2013 GoKart Labs. All rights reserved.
//

#import "GKLPhotoFetcher.h"

@implementation GKLPhotoFetcher
@synthesize delegate, photoNavigationController, allowsEditing;

+ (id)sharedPhotoFetcher{
    static GKLPhotoFetcher *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

+ (void)fetchPhotoWithDelegate:(id)delegate andNavigationController:(UINavigationController*)nav{
    GKLPhotoFetcher *fetcher = [GKLPhotoFetcher sharedPhotoFetcher];
    [fetcher setDelegate:delegate];
    [fetcher setPhotoNavigationController:nav];
    [fetcher fetchPhoto];
}

-(void)fetchPhoto{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        [[[UIActionSheet alloc] initWithTitle:@"Select a source:" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Camera", @"Photo Library", nil] showInView:photoNavigationController.view];
    } else {
        [self presentPickerWithSource:UIImagePickerControllerSourceTypePhotoLibrary];
    }
}

-(void)presentPickerWithSource:(UIImagePickerControllerSourceType)sourceType{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    [picker setSourceType:sourceType];
    [picker setDelegate:self];
    [picker setAllowsEditing:allowsEditing];
    [photoNavigationController presentViewController:picker animated:YES completion:nil];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0:
            [self presentPickerWithSource:UIImagePickerControllerSourceTypeCamera];
            break;
        case 1:
            [self presentPickerWithSource:UIImagePickerControllerSourceTypePhotoLibrary];
            break;
        default:
            break;
    }
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    UIImage *returnedImage = [info objectForKey:(allowsEditing ? UIImagePickerControllerEditedImage : UIImagePickerControllerOriginalImage )];
    [photoNavigationController dismissViewControllerAnimated:YES completion:^{
        if (delegate && [delegate respondsToSelector:@selector(photoFetcher:returnedImage:)]) {
            [delegate photoFetcher:self returnedImage:returnedImage];
        }
    }];
}

@end
