//
//  LJWebserviceHandler.h
//  LittleJohn
//
//  Created by Thopucherla, Sreekanth on 06/09/2016.
//  Copyright © 2016 Thopucherla, Sreekanth. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LJWebserviceHandler;

@protocol LJWebserviceHandlerDelegate <NSObject>

-(void)webServiceHandler:(LJWebserviceHandler*)webserviceHandler didFinishWithRespose:(NSData*)data withError:(NSError*)error;

@end

@protocol LJWebserviceHandlerProtocol <NSObject>

@property (nonatomic, weak) id<LJWebserviceHandlerDelegate> delegate;

-(void)getDataForURL:(NSURL*)url withBody:(NSData*)httpBody;

-(void)downloadImageForURL:(NSURL*)url;

@end

@interface LJWebserviceHandler : NSObject <LJWebserviceHandlerProtocol>

@property (nonatomic, weak) id<LJWebserviceHandlerDelegate> delegate;

-(void)getDataForURL:(NSURL*)url withBody:(NSData*)httpBody;

@end
