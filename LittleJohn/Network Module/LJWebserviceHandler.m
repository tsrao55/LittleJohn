//
//  LJWebserviceHandler.m
//  LittleJohn
//
//  Created by Thopucherla, Sreekanth (Isban) on 06/09/2016.
//  Copyright © 2016 Thopucherla, Sreekanth. All rights reserved.
//

#import "LJWebserviceHandler.h"

@implementation LJWebserviceHandler

-(void)getDataForURL:(NSURL *)url withBody:(NSData *)httpBody
{
  NSURLSessionConfiguration *defaultConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
  
  NSURLSession *urlSession = [NSURLSession sessionWithConfiguration:defaultConfig];
  
  NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:url];
  
  [theRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  
  if (httpBody)
  {
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody:httpBody];
  }
  else
  {
    [theRequest setHTTPMethod:@"GET"];
  }
  NSURLSessionDataTask *theTask = [urlSession dataTaskWithRequest:theRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
  {
    dispatch_async(dispatch_get_main_queue(), ^{
      if (self.delegate)
      {
        [self.delegate webServiceHandler:self didFinishWithRespose:data withError:error];
      }
    });
  }];
  [theTask resume];
}

-(void)downloadImageForURL:(NSURL *)url
{
  NSURLSessionDownloadTask *downloadTask = [[NSURLSession sharedSession] downloadTaskWithURL:url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    dispatch_async(dispatch_get_main_queue(), ^{
      NSData *data = [NSData dataWithContentsOfURL:location];
      
      if (self.delegate && data)
      {
        [self.delegate webServiceHandler:self didFinishWithRespose:data withError:nil];
      }
    });
  }];
  [downloadTask resume];
}

@end
