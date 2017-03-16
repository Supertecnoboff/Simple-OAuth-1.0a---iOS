//
//  OAuth1Controller.h
//  Simple-OAuth1
//
//  Created by Christian Hansen on 02/12/12.
//  Copyright (c) 2012 Christian-Hansen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface OAuth1Controller : NSObject <UIWebViewDelegate> {
    
    // Pass in OAuth 1.0a data links.
    NSString *pass_oauth_callback;
    NSString *pass_consumer_key;
    NSString *pass_consumer_secret;
    NSString *pass_auth_url;
    NSString *pass_request_token_url;
    NSString *pass_authenticate_url;
    NSString *pass_access_token_url;
    NSString *pass_oauth_scope_params;
}

-(void)loginWithWebView:(UIWebView *)webWiew completion:(void (^)(NSDictionary *oauthTokens, NSError *error))completion;
-(void)requestAccessToken:(NSString *)oauth_token_secret oauthToken:(NSString *)oauth_token oauthVerifier:(NSString *)oauth_verifier completion:(void (^)(NSError *error, NSDictionary *responseParams))completion;
+(NSURLRequest *)preparedRequestForPath:(NSString *)path parameters:(NSDictionary *)queryParameters HTTPmethod:(NSString *)HTTPmethod oauthToken:(NSString *)oauth_token oauthSecret:(NSString *)oauth_token_secret :(NSString *)input_api_url :(NSString *)input_consumer_secret;

// Properties - strings, URLs, etc..
@property (nonatomic, retain) NSString *pass_oauth_callback;
@property (nonatomic, retain) NSString *pass_consumer_key;
@property (nonatomic, retain) NSString *pass_consumer_secret;
@property (nonatomic, retain) NSString *pass_auth_url;
@property (nonatomic, retain) NSString *pass_request_token_url;
@property (nonatomic, retain) NSString *pass_authenticate_url;
@property (nonatomic, retain) NSString *pass_access_token_url;
@property (nonatomic, retain) NSString *pass_oauth_scope_params;

@end
