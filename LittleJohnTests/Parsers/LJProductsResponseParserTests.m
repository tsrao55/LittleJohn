//
//  LJProductsResponseParserTests.m
//  LittleJohn
//
//  Created by Thopucherla, Sreekanth (Isban) on 07/09/2016.
//  Copyright © 2016 Thopucherla, Sreekanth. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LJProductsResponseParser.h"
#import "LJProduct.h"

@interface LJProductsResponseParserTests : XCTestCase

@end

@implementation LJProductsResponseParserTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testParseProductsFromResponse
{
  NSString *path = [[NSBundle bundleForClass:[self class]] pathForResource:@"ProductsSample" ofType:@"json"];
  NSData *jsonData = [NSData dataWithContentsOfFile:path];
  NSError *jsonError;
  NSDictionary *productsResponse = [NSJSONSerialization JSONObjectWithData:jsonData
                                                                   options:NSJSONReadingAllowFragments
                                                                     error:&jsonError];
  if (!jsonError)
  {
    NSArray *products = [LJProductsResponseParser parseProductsFromResponse:productsResponse];
    XCTAssertTrue(products.count > 0, @"Products array is empty");
    for (LJProduct *product in products)
    {
      XCTAssertTrue([product isKindOfClass:[LJProduct class]], @"Products array contained invalid objects");
    }
  }
  else
  {
    XCTAssertTrue(false, @"JSON Serialisation failed");
  }
  
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
