const amplifyconfig = ''' {
  "UserAgent": "aws-amplify-cli/2.0",
  "Version": "1.0",
  "auth": {
    "plugins": {
      "awsCognitoAuthPlugin": {
        "IdentityManager": {
          "Default": {}
        },
        "CognitoUserPool": {
          "Default": {
            "PoolId": "us-west-1_yzZOi9VAq",
            "AppClientId": "2qovr9qau4bp7g98t37kn0r5hh",
            "Region": "us-west-1"
          }
        },
        "Auth": {
          "Default": {
            "authenticationFlowType": "USER_SRP_AUTH",
            "passwordProtectionSettings": {
            "passwordPolicyMinLength":8,
            "passwordPolicyCharacters": []
            }
          }
        }
      }
    }
  }
}''';