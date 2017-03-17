//
//  ViewController.m
//  Simple OAuth 1.0a
//
//  Created by Daniel Sadjadian on 16/03/2017.
//  Copyright © 2017 Daniel Sadjadian. All rights reserved.
//

#import "ViewController.h"
#import "OAuth1Controller.h"
#import "LoginWebViewController.h"

@interface ViewController () {
    
}

@property (nonatomic, strong) OAuth1Controller *oauth1Controller;

@end

@implementation ViewController

/// BUTTONS ///

-(IBAction)loginToTwitter {
    
    // Set the various OAuth 1.0a settings.
    self.oauth1Controller.pass_oauth_callback = @"YOUR-CALLBACK-HERE";
    self.oauth1Controller.pass_consumer_key = @"YOUR-KEY-HERE";
    self.oauth1Controller.pass_consumer_secret = @"YOUR-SECRET-HERE";
    self.oauth1Controller.pass_auth_url = @"https://api.twitter.com/oauth";
    self.oauth1Controller.pass_api_url = @"api.twitter.com/oauth";
    self.oauth1Controller.pass_request_token_url = @"/request_token";
    self.oauth1Controller.pass_authenticate_url = @"/authorize";
    self.oauth1Controller.pass_access_token_url = @"/access_token";
    self.oauth1Controller.pass_oauth_scope_params = @"";
    
    // Setup the OAuth 1.0a login view.
    UIStoryboard *story_file = [UIStoryboard storyboardWithName:@"LoginWebViewController" bundle:nil];
    LoginWebViewController *login_view = [story_file instantiateViewControllerWithIdentifier:@"loginOA1"];
    
    // Open the OAuth 1.0a login view.
    [self presentViewController:login_view animated:YES completion:^{
        
        NSLog(@"ONE");
        
        // Begin the OAuth 1.0a authentication process.
        [self.oauth1Controller loginWithWebView:login_view.webView completion:^(NSDictionary *oauthTokens, NSError *error) {
            
            if (!error) {
                NSLog(@"Success: %@", oauthTokens);
            }
            
            else {
                NSLog(@"Error authenticating: %@", error);
            }
            
            // Now close OAuth 1.0a login view.
            [self dismissViewControllerAnimated:YES completion: ^{
                self.oauth1Controller = nil;
            }];
        }];
    }];
}

/// VIEW DID LOAD ///

-(void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

/// OAUTH METHODS ///

-(OAuth1Controller *)oauth1Controller {
    
    if (_oauth1Controller == nil) {
        _oauth1Controller = [[OAuth1Controller alloc] init];
    }
    
    return _oauth1Controller;
}

/// OTHER METHODS ///

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
