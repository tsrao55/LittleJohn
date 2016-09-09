//
//  LJProductDownloadManager.h
//  LittleJohn
//
//  Created by Thopucherla, Sreekanth on 07/09/2016.
//  Copyright © 2016 Thopucherla, Sreekanth. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LJProductDownloadManager;

@protocol LJProductDownloadManagerDelegate <NSObject>
-(void)downloadManager:(LJProductDownloadManager*)downloadManager didGetLatestProducts:(NSArray*)products;
//Needs another delegate method to throw errors
@end

@interface LJProductDownloadManager : NSObject

@property(nonatomic, weak) id<LJProductDownloadManagerDelegate> delegate;

//This needs to be accepting page number in future to support the multiple pages
-(void)getLatestProducts;

@end
