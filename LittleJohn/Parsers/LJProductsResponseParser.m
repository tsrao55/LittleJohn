//
//  LJProductsResponseParser.m
//  LittleJohn
//
//  Created by Thopucherla, Sreekanth on 07/09/2016.
//  Copyright © 2016 Thopucherla, Sreekanth. All rights reserved.
//

#import "LJProductsResponseParser.h"
#import "LJProduct.h"

static NSString* const kProductsKey = @"products";

@implementation LJProductsResponseParser

+(NSArray*)parseProductsFromResponse:(NSDictionary *)responseDictionary
{
  //Assuming never passed a nil argument
  NSMutableArray *products = [NSMutableArray array];
  NSArray *productsArray = responseDictionary[kProductsKey];
  
  for (NSDictionary* productDic in productsArray)
  {
    LJProduct *product = [[LJProduct alloc] initWithDictionary:productDic];
    [products addObject:product];
  }
  
  return products;
}

@end
