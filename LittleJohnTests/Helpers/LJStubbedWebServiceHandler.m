//
//  LJStubbedWebServiceHandler.m
//  LittleJohn
//
//  Created by Thopucherla, Sreekanth (Isban) on 08/09/2016.
//  Copyright © 2016 Thopucherla, Sreekanth. All rights reserved.
//

#import "LJStubbedWebServiceHandler.h"

@implementation LJStubbedWebServiceHandler

-(void)getDataForURL:(NSURL*)url withBody:(NSData*)httpBody {


  if (self.delegate != nil) {
    
// Needs to mock the stubbed data to use in download manager 
  }
}


@end
