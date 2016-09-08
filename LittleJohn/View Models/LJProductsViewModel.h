//
//  LJProductsViewModel.h
//  LittleJohn
//
//  Created by Thopucherla, Sreekanth (Isban) on 07/09/2016.
//  Copyright © 2016 Thopucherla, Sreekanth. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LJProductsViewModel;

@protocol LJProductsViewModelDelegate <NSObject>
-(void)viewModel:(LJProductsViewModel*)viewModel didFinifhLoadingProducts:(NSArray*)productsArray;
@end

@interface LJProductsViewModel : NSObject

@property (nonatomic, readonly) NSMutableArray *productsArray;
@property (nonatomic, readonly) BOOL loading;
@property (nonatomic, weak) id<LJProductsViewModelDelegate> delegate;

-(void)loadProducts;
//needs to add method to retrieve products for next page
@end
