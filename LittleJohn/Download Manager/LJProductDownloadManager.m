//
//  LJProductDownloadManager.m
//  LittleJohn
//
//  Created by Thopucherla, Sreekanth (Isban) on 07/09/2016.
//  Copyright © 2016 Thopucherla, Sreekanth. All rights reserved.
//

#import "LJProductDownloadManager.h"
#import "LJWebserviceHandler.h"
#import "LJProductsResponseParser.h"

static NSString* const productURL = @"https://api.johnlewis.com/v1/products/search?q=dishwasher&key=Wu1Xqn3vNrd1p7hqkvB6hEu0G9OrsYGb&pageSize=20";

@interface LJProductDownloadManager() <LJWebserviceHandlerDelegate>
@property (nonatomic, strong) id<LJWebserviceHandlerProtocol> webServiceHandler;
@end

@implementation LJProductDownloadManager

-(void)getLatestProducts
{
  self.webServiceHandler = [[LJWebserviceHandler alloc] init];
  self.webServiceHandler.delegate = self;
  [self.webServiceHandler getDataForURL:[NSURL URLWithString:productURL] withBody:nil];
}

#pragma mark - LJWebserviceHandlerDelegate

-(void)webServiceHandler:(LJWebserviceHandler *)webserviceHandler didFinishWithRespose:(NSData *)data withError:(NSError *)error
{
  if (!error)
  {
    NSError *jsonError;
    NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                       options:NSJSONReadingAllowFragments
                                                                         error:&jsonError];
    if (responseDictionary && !jsonError)
    {
      //Call the didFinishWith products
      NSArray *products = [LJProductsResponseParser parseProductsFromResponse:responseDictionary];
      if ([self.delegate respondsToSelector:@selector(downloadManager:didGetLatestProducts:)])
      {
        [self.delegate downloadManager:self didGetLatestProducts:products];
      }
    }
    else
    {
      //call the error delgate
    }
    
  }
  else
  {
   //call the error delgate
  }
}
@end
