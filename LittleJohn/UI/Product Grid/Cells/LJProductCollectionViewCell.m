//
//  LJProductCollectionViewCell.m
//  LittleJohn
//
//  Created by Thopucherla, Sreekanth (Isban) on 07/09/2016.
//  Copyright © 2016 Thopucherla, Sreekanth. All rights reserved.
//

#import "LJProductCollectionViewCell.h"

@implementation LJProductCollectionViewCell

-(void)prepareForReuse
{
  self.productImageView.image = nil;
  self.productPriceLabel.text = @"";
  self.productTitleLabel.text = @"";
}
@end
