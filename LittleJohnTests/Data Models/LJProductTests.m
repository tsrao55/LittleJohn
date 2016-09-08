//
//  LJProductTests.m
//  LittleJohn
//
//  Created by Thopucherla, Sreekanth (Isban) on 06/09/2016.
//  Copyright © 2016 Thopucherla, Sreekanth. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LJProduct.h"

@interface LJProductTests : XCTestCase

@end

@implementation LJProductTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testProductSuccess
{
  NSDictionary *productDummyDictionary = @{ @"productId": @"2915517",
                                            @"type": @"product",
                                            @"title": @"Whirlpool WFO3P33DLUK Freestanding Dishwasher, WhIte",
                                            @"code": @"81704201",
                                            @"price": @{@"was": @"",
                                                        @"then1": @"",
                                                        @"then2": @"",
                                                        @"now": @"599.00",
                                                        @"uom": @"",
                                                        @"currency": @"GBP"
                                                        },
                                            @"averageRating": @0.0,
                                            @"reviews": @0,
                                            @"image": @"//johnlewis.scene7.com/is/image/JohnLewis/236331171?",
                                            @"displaySpecialOffer": @"",
                                           };
  
  LJProduct *product = [[LJProduct alloc] initWithDictionary:productDummyDictionary];
  
  XCTAssertTrue([product.productID isEqualToString:@"2915517"]);
  XCTAssertTrue([product.title isEqualToString:@"Whirlpool WFO3P33DLUK Freestanding Dishwasher, WhIte"]);
  XCTAssertTrue([product.currentPriceString isEqualToString:@"£599.00"]);
  XCTAssertTrue([product.imageURL isEqual:[NSURL URLWithString:@"https://johnlewis.scene7.com/is/image/JohnLewis/236331171?"]]);
}

@end
