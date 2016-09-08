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
@end

@implementation LJProductImageDownloader

-(void)getImageForProductId:(NSString *)productId withURL:(NSURL *)url
{
  self.productId = productId;
  self.webserviceHandler = [LJWebserviceHandler new];
  self.webserviceHandler.delegate = self;
  [self.webserviceHandler getDataForURL:url withBody:nil];
}

#pragma mark - LJWebserviceHandlerDelegate

-(void)webServiceHandler:(LJWebserviceHandler *)webserviceHandler didFinishWithRespose:(NSData *)data withError:(NSError *)error
{
  if (!error && data)
  {
    UIImage *downloadedImage = [UIImage imageWithData:data];
    if (downloadedImage && [self.delegate respondsToSelector:@selector(imageDownloader:didFinishDownloading:for:)])
    {
      [self.delegate imageDownloader:self didFinishDownloading:downloadedImage for:self.productId];
    }
    else
    {
      //Write a delegate method for handling error
    }
  }
}

@end
