//
//  LJProduct.h
//  LittleJohn
//
//  Created by Thopucherla, Sreekanth on 06/09/2016.
//  Copyright © 2016 Thopucherla, Sreekanth. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

static NSString * const kProductIDKey = @"productId";
static NSString * const kProductPriceKey = @"price";
static NSString * const kProductPriceNowKey = @"now";
static NSString * const kProductTitleKey = @"title";
static NSString * const kProductImageKey = @"image";

@interface LJProduct : NSObject

@property (nonatomic, readonly) NSString* productID;
@property (nonatomic, readonly) NSNumber* currentPrice;
@property (nonatomic, readonly) NSString* title;
@property (nonatomic, readonly) NSURL* imageURL;
@property (nonatomic, strong) UIImage* downloadedImage;
@property (nonatomic, readonly) NSString* currentPriceString;

-(id)initWithDictionary:(NSDictionary*)productDictionary;
@end
