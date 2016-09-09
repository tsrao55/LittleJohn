//
//  LLJProductsViewModelTests.m
//  LittleJohn
//
//  Created by Thopucherla, Sreekanth on 07/09/2016.
//  Copyright © 2016 Thopucherla, Sreekanth. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LJProductsViewModel.h"

@interface LLJProductsViewModelTests : XCTestCase

@end

@implementation LLJProductsViewModelTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testLoadProducts
{
  LJProductsViewModel *productsViewModel = [[LJProductsViewModel alloc] init];
  [productsViewModel loadProducts];
  XCTAssertTrue(productsViewModel.loading, @"Products View model not loading");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
