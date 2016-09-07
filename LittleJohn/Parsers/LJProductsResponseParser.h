//
//  LJProductsResponseParser.h
//  LittleJohn
//
//  Created by Thopucherla, Sreekanth (Isban) on 07/09/2016.
//  Copyright © 2016 Thopucherla, Sreekanth. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LJProductsResponseParser : NSObject

+(NSArray*)parseProductsFromResponse:(NSDictionary*)responseDictionary;

@end
