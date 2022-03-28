# Symfony_Auth_API

## Install Project

1. `composer install` || `composer update`
2. Open and run local server for database (laragon, wamp, xamp, mamp ...)
3. `php bin/console doctrine:database:create`
4. `php bin/console make:migration`
5. `php bin/console doctrine:migrations:migrate`
6. Run the symfony server with the command: `symfony server:start`  
  ***/!\ If you does'nt use symfony CLI, Open project with laragon, mamp, xamp, wamp...***

We need SSH private/public keys for Auth:  
7. Create a **jwt** folder into config folder  
8. In terminal run: `openssl genrsa -out config/jwt/private.pem -aes256 4096` and follow instruction (SAVE PASSPHRASE)  
9. Still in your terminal, run: `openssl rsa -pubout -in config/jwt/private.pem -out config/jwt/public.pem` and follow instructions with same passphrase than private key.  
10. Create .env.local file at the rot of the project, paste this in and replace `your_pass_phrase` with the passphrase used for keys generation:  
    ```
      ###> lexik/jwt-authentication-bundle ###
      JWT_PASSPHRASE=your_pass_phrase
      ###< lexik/jwt-authentication-bundle ###
    ```
11. Finally, run `yarn run watch` at the root and go to `127.0.0.1:{port}/` || `http://localhost:{port}/`  

## Given users  
1. Admin user, can access the user dashboard and make changes/create ...:  
  ```
    email: john@doe.com
    password: 0000
  ```
2. Normal user, cannot access to dashboard and see the control access:  
  ```  
    email: test@test.com
    password: 0000
  ```  
    
## API route Documentation  
`127.0.0.1:{port}/api` || `http://localhost:{port}/api`
