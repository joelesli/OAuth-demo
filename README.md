# OAuth Demo

This is an implementation of Google OAuth by following the video from [CJ Avilla](https://youtu.be/Lut1C6CHDCE?si=w4zNrYeDBBZxyOqs). 

AOuth for:
1. google
2. facebook
3. asana (not active, asana doesn't seem to allow testing of unapproved apps.)
4. [nhn](https://utviklerportal.nhn.no/informasjonstjenester/helseid/protokoller-og-sikkerhetsprofil/sikkerhetsprofil-for-helseid/security-profile-for-helseid/)

## Things to configure

### Gems needed
The [guide](https://github.com/heartcombo/devise/wiki/OmniAuth:-Overview) for setting up OAuth with devise.  
```ruby
    gem 'devise'
    gem 'omniauth-google-oauth2'
    gem "omniauth-rails_csrf_protection"
```

Call backs URI format
```http://localhost:3000/users/auth/<PROVIDER>/callback```
The provider depends on the name you enter when configuring devise.rb

### Credentials
For an added level of security, the credentials.yml.enc file is not included in the git repo. To create one use
```EDITOR="mate --wait" bin/rails credentials:edit``` and add the credentials of the OAuth providers with this 
structure:

```yml
google:
  client_id: <YOUR ID>
  client_secret: <YOUR SECRET>
```

Things you may want to cover:

### Helpful documentatin

1. [Create an oauth strategy for slack](https://dev.to/vvo/devise-create-a-local-omniauth-strategy-for-slack-4066)

* Ruby version 7

* Configuration: see changes to devise.rb and development.rb

* Database: postgresql

* Database: rails db:create db:migrate


