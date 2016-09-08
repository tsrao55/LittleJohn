//
//  LJWebserviceHandlerTests.m
//  LittleJohn
//
//  Created by Thopucherla, Sreekanth (Isban) on 06/09/2016.
//  Copyright © 2016 Thopucherla, Sreekanth. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LJWebserviceHandler.h"

@interface LJWebserviceHandlerTests : XCTestCase <LJWebserviceHandlerDelegate>
@property (nonatomic, retain) XCTestExpectation *downloadExpectation;
@end

@implementation LJWebserviceHandlerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testGetDataWithURL
{
  self.downloadExpectation = [self expectationWithDescription:@"download data"];
  LJWebserviceHandler *webServiceHandler = [[LJWebserviceHandler alloc] init];
  webServiceHandler.delegate = self;
  
  [webServiceHandler getDataForURL:[NSURL URLWithString:@"https://api.johnlewis.com/v1/products/search?q=dishwasher&key=Wu1Xqn3vNrd1p7hqkvB6hEu0G9OrsYGb&pageSize=20"] withBody:nil];
  
  [self waitForExpectationsWithTimeout:5 handler:nil];
}

- (void)webServiceHandler:(LJWebserviceHandler *)webserviceHandler didFinishWithRespose:(NSData *)data withError:(NSError *)error
{
  if (!error && data)
  {
    [self.downloadExpectation fulfill];
  }
  else
  {
    NSLog(@"Download Data failed with error: %@",[error description]);
  }
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
