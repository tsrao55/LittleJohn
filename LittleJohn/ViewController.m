//
//  ViewController.m
//  LittleJohn
//
//  Created by Thopucherla, Sreekanth (Isban) on 06/09/2016.
//  Copyright © 2016 Thopucherla, Sreekanth. All rights reserved.
//

#import "ViewController.h"
#import "LJProductsViewModel.h"
#import "LJProductCollectionViewCell.h"
#import "LJProduct.h"

static NSString* const kProductCellIdentifier = @"ppp";

@interface ViewController () <LJProductsViewModelDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *productsCollectionView;
@property (nonatomic, strong) LJProductsViewModel *viewModel;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  self.viewModel = [[LJProductsViewModel alloc] init];
  self.viewModel.delegate = self;
  self.productsCollectionView.backgroundColor = [UIColor darkGrayColor];
}

-(void)viewDidAppear:(BOOL)animated
{
  [self.viewModel loadProducts];  
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
  return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
  return self.viewModel.productsArray.count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
  LJProductCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kProductCellIdentifier forIndexPath:indexPath];
  if (cell)
  {
    LJProduct *product = self.viewModel.productsArray[indexPath.row];
    cell.productTitleLabel.text = product.title;
    cell.productPriceLabel.text = product.currentPriceString;
    if (product.downloadedImage)
    {
      cell.productImageView.image = product.downloadedImage;
    }
    else
    {
      [self.viewModel downloadImageAtIndex:indexPath.row];
    }
  }
  return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
  float width = 255,height = 335;
  if (self.view.traitCollection.verticalSizeClass == UIUserInterfaceSizeClassRegular &&
      self.view.traitCollection.horizontalSizeClass == UIUserInterfaceSizeClassRegular)
  {
    //calculate best sizes for ipad
  }
  else if (self.view.traitCollection.horizontalSizeClass == UIUserInterfaceSizeClassRegular)
  {
    //Iphone 6 plus portrait, want to show more cells?
  }
  else
  {
    //smaller devices may be need to show only one cell at a time.
  }
  
  return CGSizeMake(width, height);
}

#pragma mark - UICollectionViewDelegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
  [collectionView deselectItemAtIndexPath:indexPath animated:YES];
}

#pragma mark - LJProductsViewModelDelegate
-(void)viewModel:(LJProductsViewModel *)viewModel didFinifhLoadingProducts:(NSArray *)productsArray
{
  //Ideally, needs to insert new rows
  [self.productsCollectionView reloadData];
}

-(void)viewModel:(LJProductsViewModel *)viewModel didFinishedDownloadingImageAtIndex:(NSInteger)index
{
  NSArray *visibleIndexes = [self.productsCollectionView indexPathsForVisibleItems];
  NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:0];
  if ([visibleIndexes containsObject:indexPath])
  {
    LJProductCollectionViewCell *cell = (LJProductCollectionViewCell*)[self.productsCollectionView cellForItemAtIndexPath:indexPath];
    LJProduct *pro = self.viewModel.productsArray[index];
    cell.productImageView.image = pro.downloadedImage;
  }
}

@end
