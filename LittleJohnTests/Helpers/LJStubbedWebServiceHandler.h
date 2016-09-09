//
//  LJStubbedWebServiceHandler.h
//  LittleJohn
//
//  Created by Thopucherla, Sreekanth on 08/09/2016.
//  Copyright © 2016 Thopucherla, Sreekanth. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LJWebserviceHandler.h"

@interface LJStubbedWebServiceHandler : NSObject <LJWebserviceHandlerProtocol>

@property (nonatomic, weak) id<LJWebserviceHandlerDelegate> delegate;


-(void)getDataForURL:(NSURL*)url withBody:(NSData*)httpBody;


@end
