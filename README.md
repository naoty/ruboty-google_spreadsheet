# Ruboty::GoogleSpreadsheet

Store [Ruboty](https://github.com/r7kamura/ruboty/)'s memory in Google Spreadsheet.

## Installation

```ruby
# Gemfile
gem "ruboty-google_spreadsheet"
```

## ENV

```bash
GOOGLE_CLIENT_ID       - Client ID
GOOGLE_CLIENT_SECRET   - Client secret
GOOGLE_REDIRECT_URI    - Redirect URI
GOOGLE_REFRESH_TOKEN   - Refresh token issued with access token
GOOGLE_SPREADSHEET_KEY - Spreadsheet key (e.g. https://docs.google.com/spreadsheets/d/<key>/edit#gid=0)
```

## Refresh token

```bash
% open "https://accounts.google.com/o/oauth2/auth\
?access_type=offline\
&client_id=${CLIENT_ID}\
&redirect_uri=${REDIRECT_URI}\
&response_type=code\
&scope=https://www.googleapis.com/auth/drive"
```

```bash
% curl \
> -d "client_id=${CLIENT_ID}" \
> -d "client_secret=${CLIENT_SECRET}" \
> -d "redirect_uri=${REDIRECT_URI}" \
> -d "grant_type=authorization_code" \
> -d "code=${CODE}" \
> "https://accounts.google.com/o/oauth2/token"
{
  "access_token" : "...",
  "token_type" : "Bearer",
  "expires_in" : 3600,
  "refresh_token" : "..."
}
```
