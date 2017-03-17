# Simple-OAuth-1.0a---iOS
A super simple OAuth 1.0a implementation for iOS.

Note: This is a vary basic implementation/mashup of [TDOAuth](https://github.com/tweetdeck-archive/TDOAuth) and [simple-oauth1](https://github.com/chrhansen/simple-oauth1).

This is an example Xcode project showing you how to login/authenticate with an OAuth 1.0a services (ie: Twitter).

**Installation**

1. Drag and drop the OAuth library files to your Xcode project.

2. ```#import``` the following files:

```
#import "OAuth1Controller.h"
#import "LoginWebViewController.h"
```

3. Create the following @property:

```
@property (nonatomic, strong) OAuth1Controller *oauth1Controller;
```

4. Add the intialisation method to your implementation file:

```
-(OAuth1Controller *)oauth1Controller {
    
    if (_oauth1Controller == nil) {
        _oauth1Controller = [[OAuth1Controller alloc] init];
    }
    
    return _oauth1Controller;
}
```

5. Create an ```IBAction``` in your header file and a ```UIButton``` in your user interface file, then link them together.

6. Add the following code to your ```IBAction```:

```
-(IBAction)login {
    
    // Set the various OAuth 1.0a settings - Twitter example.
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
```

**Other**

You will need to create a developer account and get the appropriate OAuth related info (such as a consumer key), in order for this to work.

