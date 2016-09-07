//
//  LJProductDownloadManager.h
//  LittleJohn
//
//  Created by Thopucherla, Sreekanth (Isban) on 07/09/2016.
//  Copyright © 2016 Thopucherla, Sreekanth. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LJProductDownloadManager : NSObject

//This needs to be accepting page number in future to support the multiple pages
-(void)getLatestProducts;

@end
