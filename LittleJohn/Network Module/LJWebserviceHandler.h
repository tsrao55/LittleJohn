//
//  LJWebserviceHandler.h
//  LittleJohn
//
//  Created by Thopucherla, Sreekanth (Isban) on 06/09/2016.
//  Copyright © 2016 Thopucherla, Sreekanth. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LJWebserviceHandler;

@protocol LJWebserviceHandlerDelegate <NSObject>

-(void)webServiceHandler:(LJWebserviceHandler*)webserviceHandler didFinishWithRespose:(NSData*)data withError:(NSError*)error;

@end

@interface LJWebserviceHandler : NSObject

@property (nonatomic, weak) id<LJWebserviceHandlerDelegate> delegate;

-(void)getDataForURL:(NSURL*)url withBody:(NSData*)httpBody;
@end
