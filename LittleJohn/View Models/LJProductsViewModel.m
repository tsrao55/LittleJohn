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

@property (nonatomic, strong) NSMutableArray *productsArray;
@property (nonatomic, assign) BOOL loading;
@property (nonatomic, strong) LJProductDownloadManager *downloadManager;
@property (nonatomic, retain) ViewController* productsVC;

@end

@implementation LJProductsViewModel

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
