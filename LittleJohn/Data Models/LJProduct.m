//
//  LJProduct.m
//  LittleJohn
//
//  Created by Thopucherla, Sreekanth (Isban) on 06/09/2016.
//  Copyright © 2016 Thopucherla, Sreekanth. All rights reserved.
//

#import "LJProduct.h"
#import "UIKit/UIKit.h"

@interface LJProduct()

@property (nonatomic, strong) NSString* productID;
@property (nonatomic, strong) NSNumber* currentPrice;
@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) NSURL* imageURL;
@property (nonatomic, strong) NSString* currentPriceString;
@end

@implementation LJProduct

-(id)initWithDictionary:(NSDictionary *)productDictionary
{
  if (self = [super init])
  {
    //Assuming product dictionary will be always perfect
    _productID = productDictionary[kProductIDKey];
    NSDictionary *priceDictionary = [NSDictionary dictionaryWithDictionary:productDictionary[kProductPriceKey]];
    _currentPrice = [NSNumber numberWithDouble:[priceDictionary[kProductPriceNowKey] doubleValue]];
    _title = productDictionary[kProductTitleKey];
    NSString *urlString = [NSString stringWithFormat:@"https:%@", productDictionary[kProductImageKey]];
    _imageURL = [NSURL URLWithString:urlString];
  }
  
  return self;
}

-(NSString*)currentPriceString
{
  NSNumberFormatter *currencyFormatter = [[NSNumberFormatter alloc] init];
  [currencyFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
  NSLocale *uk = [[NSLocale alloc] initWithLocaleIdentifier:@"en_GB"];
  [currencyFormatter setLocale:uk];
  [currencyFormatter setMaximumFractionDigits:2];
  
  return [currencyFormatter stringFromNumber:self.currentPrice];
}
@end
