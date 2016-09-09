//
//  LJProductsViewModel.m
//  LittleJohn
//
//  Created by Thopucherla, Sreekanth on 07/09/2016.
//  Copyright © 2016 Thopucherla, Sreekanth. All rights reserved.
//

#import "LJProductsViewModel.h"
#import "ViewController.h"
#import "LJProductDownloadManager.h"
#import "LJProductImageDownloader.h"
#import "LJProduct.h"

@interface LJProductsViewModel() <LJProductDownloadManagerDelegate>

@property (nonatomic, strong) NSMutableArray *productsArray;
@property (nonatomic, assign) BOOL loading;
@property (nonatomic, strong) LJProductDownloadManager *downloadManager;
@property (nonatomic, strong) LJProductImageDownloader *imageDownloader;
@property (nonatomic, strong) ViewController* productsVC;
@property (nonatomic, strong) NSMutableArray* downloadQueue;

@end

@implementation LJProductsViewModel

-(NSMutableArray*)downloadQueue
{
  if (!_downloadQueue)
  {
    _downloadQueue = [[NSMutableArray alloc] init];
  }
  
  return _downloadQueue;
}

-(LJProductImageDownloader*)imageDownloader
{
  if (!_imageDownloader)
  {
    _imageDownloader = [[LJProductImageDownloader alloc] init];
  }
  return _imageDownloader;
}

-(void)loadProducts
{
  if (!self.loading)
  {
    self.downloadManager = [[LJProductDownloadManager alloc] init];
    self.downloadManager.delegate = self;
    [self.downloadManager getLatestProducts];
    self.loading = YES;
  }
}

-(void)downloadImageAtIndex:(NSInteger)index
{
  LJProduct *product = self.productsArray[index];

  if (![self.downloadQueue containsObject:product])
  {
    [self.downloadQueue addObject:product];
  }
  
  [self downloadFromQueue];
}

-(void)downloadFromQueue
{
  if (self.downloadQueue.count > 0)
  {
    LJProduct *product = self.downloadQueue[0];
    [self.imageDownloader getImageForProductId:product.productID
                                       withURL:product.imageURL
                               completionBlock:^(UIImage *downloadedImage, NSString *productId, NSError *error) {
                                 NSArray *p = [self.productsArray filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"productID == %@", productId]];
                                 LJProduct *product = p[0];
                                 product.downloadedImage = downloadedImage;
                                 [self.downloadQueue removeObject:product];
                                 [self.delegate viewModel:self didFinishedDownloadingImageAtIndex:[self.productsArray indexOfObject:product]];
                                 if (self.downloadQueue.count > 0)
                                 {
                                   [self downloadFromQueue];
                                 }
                               }];
  }
  
}

#pragma mark - LJProductDownloadManagerDelegate
-(void)downloadManager:(LJProductDownloadManager *)downloadManager didGetLatestProducts:(NSArray *)products
{
  self.loading = NO;
  if (products)
  {
    if (!self.productsArray)
    {
      self.productsArray = [NSMutableArray array];
    }
    [self.productsArray addObjectsFromArray:products];
    
    if ([self.delegate respondsToSelector:@selector(viewModel:didFinifhLoadingProducts:)])
    {
      [self.delegate viewModel:self didFinifhLoadingProducts:self.productsArray];
    }
  }
}
@end
