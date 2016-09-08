//
//  LJProductImageDownloader.m
//  LittleJohn
//
//  Created by Thopucherla, Sreekanth (Isban) on 08/09/2016.
//  Copyright © 2016 Thopucherla, Sreekanth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LJProductImageDownloader.h"
#import "LJWebserviceHandler.h"

@interface LJProductImageDownloader() <LJWebserviceHandlerDelegate>
@property (nonatomic, strong) NSString *productId;
@property (nonatomic, strong) LJWebserviceHandler *webserviceHandler;
@property (nonatomic, strong) ImageDownloaderBlock completionBlock;

@end

@implementation LJProductImageDownloader

-(void)getImageForProductId:(NSString *)productId withURL:(NSURL *)url completionBlock:(ImageDownloaderBlock)completionBlock
{
  self.productId = productId;
  self.webserviceHandler = [[LJWebserviceHandler alloc] init];
  self.webserviceHandler.delegate = self;
  [self.webserviceHandler downloadImageForURL:url];
  self.completionBlock = completionBlock;
}

#pragma mark - LJWebserviceHandlerDelegate

-(void)webServiceHandler:(LJWebserviceHandler *)webserviceHandler didFinishWithRespose:(NSData *)data withError:(NSError *)error
{
  if (!error && data)
  {
    UIImage *downloadedImage = [UIImage imageWithData:data];
    if (self.completionBlock)
    {
      self.completionBlock(downloadedImage, self.productId, error);
    }
  }
}

@end
