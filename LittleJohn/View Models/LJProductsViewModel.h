//
//  LJProductsViewModel.h
//  LittleJohn
//
//  Created by Thopucherla, Sreekanth (Isban) on 07/09/2016.
//  Copyright © 2016 Thopucherla, Sreekanth. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LJProductsViewModel : NSObject

@property (nonatomic, readonly) NSArray *productsArray;
@property (nonatomic, readonly) BOOL loading;

-(void)loadProducts;
//needs to add method to retrieve products for next page
@end
