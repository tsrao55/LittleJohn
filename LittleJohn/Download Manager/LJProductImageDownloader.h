//
//  LJProductImageDownloader.h
//  LittleJohn
//
//  Created by Thopucherla, Sreekanth on 08/09/2016.
//  Copyright © 2016 Thopucherla, Sreekanth. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LJProductImageDownloader;

typedef void(^ImageDownloaderBlock)(UIImage* downloadedImage, NSString* productId, NSError* error);

@interface LJProductImageDownloader : NSObject
-(void)getImageForProductId:(NSString*)productId withURL:(NSURL*)url completionBlock:(ImageDownloaderBlock)completionBlock;
@end
