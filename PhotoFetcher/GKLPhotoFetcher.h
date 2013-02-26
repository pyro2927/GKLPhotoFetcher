//
//  GKLPhotoFetcher.h
//  PhotoFetcher
//
//  Created by Joseph Pintozzi on 1/14/13.
//  Copyright (c) 2013 GoKart Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GKLPhotoFetcherDelegate <NSObject>
- (void)photoFetcher:(id)fetcher returnedImage:(UIImage*)image;
@end

@interface GKLPhotoFetcher : NSObject<UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIActionSheetDelegate>{
    UINavigationController *photoNavigationController;
    id delegate;
    bool allowsEditing;
}

@property (nonatomic, retain) UINavigationController *photoNavigationController;
@property id delegate;
@property bool allowsEditing;

+ (id)sharedPhotoFetcher;
+ (void)fetchPhotoWithDelegate:(id)delegate andNavigationController:(UINavigationController*)nav;
-(void)fetchPhoto;

@end