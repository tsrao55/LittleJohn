//
//  LJWebserviceHandler.m
//  LittleJohn
//
//  Created by Thopucherla, Sreekanth (Isban) on 06/09/2016.
//  Copyright © 2016 Thopucherla, Sreekanth. All rights reserved.
//

#import "LJWebserviceHandler.h"

@interface LJWebserviceHandler() <NSURLSessionDelegate, NSURLSessionDataDelegate, NSURLSessionTaskDelegate, NSURLSessionDownloadDelegate>

@property (nonatomic, assign) BOOL downloaded;
@end


@implementation LJWebserviceHandler

-(void)getDataForURL:(NSURL *)url withBody:(NSData *)httpBody
{
  NSURLSessionConfiguration *defaultConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
  NSURLSession *theSession = [NSURLSession sessionWithConfiguration:defaultConfig delegate:self delegateQueue:nil];
  NSURLSessionDownloadTask *downloadTask = [theSession downloadTaskWithURL:url];
  self.downloaded = NO;
  [downloadTask resume];
}

-(BOOL)isDownlodCompleted
{
  return self.downloaded;
}

-(void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler
{
  NSLog(@"response");
}

-(void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data
{
  NSLog(@"data + ");
}

-(void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
{
  //    self.downloaded = YES;
}

-(void)URLSession:(NSURLSession *)session downloadTask:(nonnull NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(nonnull NSURL *)location
{
  NSData *downloadedData = [NSData dataWithContentsOfURL:location];
  
  if ([self.delegate respondsToSelector:@selector(webServiceHandler:didFinishWithRespose:withError:)])
  {
    [self.delegate webServiceHandler:self didFinishWithRespose:downloadedData withError:nil];
  }
  
  self.downloaded = YES;
}

@end
