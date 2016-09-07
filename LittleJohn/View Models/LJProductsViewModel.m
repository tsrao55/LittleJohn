//
//  LJProductsViewModel.m
//  LittleJohn
//
//  Created by Thopucherla, Sreekanth (Isban) on 07/09/2016.
//  Copyright © 2016 Thopucherla, Sreekanth. All rights reserved.
//

#import "LJProductsViewModel.h"
#import "ViewController.h"
#import "LJProductDownloadManager.h"

@interface LJProductsViewModel() <LJProductDownloadManagerDelegate>

@property (nonatomic, strong) NSArray *productsArray;
@property (nonatomic, assign) BOOL loading;

@property (nonatomic, retain) ViewController* productsVC;

@end

@implementation LJProductsViewModel

-(void)loadProducts
{
  if (!self.loading)
  {
    LJProductDownloadManager *downloadManager = [LJProductDownloadManager new];
    downloadManager.delegate = self;
    [downloadManager getLatestProducts];
    self.loading = YES;
  }
}

#pragma mark - LJProductDownloadManagerDelegate
-(void)downloadManager:(LJProductDownloadManager *)downloadManager didGetLatestProducts:(NSArray *)products
{
  self.loading = NO;
  if (products)
  {
    self.productsArray = products;
  }
}
@end
