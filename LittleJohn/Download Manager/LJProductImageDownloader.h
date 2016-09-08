//
//  LJProductImageDownloader.h
//  LittleJohn
//
//  Created by Thopucherla, Sreekanth (Isban) on 08/09/2016.
//  Copyright © 2016 Thopucherla, Sreekanth. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LJProductImageDownloader;

@protocol LJProductImageDownloaderDelegate  <NSObject>
-(void)imageDownloader:(LJProductImageDownloader*)imageDownloader didFinishDownloading:(UIImage*)image for:(NSString*)productId;
@end

@interface LJProductImageDownloader : NSObject
@property (nonatomic, weak) id<LJProductImageDownloaderDelegate> delegate;
-(void)getImageForProductId:(NSString*)productId withURL:(NSURL*)url;
@end
