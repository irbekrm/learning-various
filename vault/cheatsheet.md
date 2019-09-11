## policies

_vault policy write <policy-name> <policy-file-path>_ // register new policy

_vault policy list_ // list all existing policies

## approles

_vault list /auth/approle/role_ // list all existing roles

_vault read /auth/approle/role/\<role-name\>/role-id_ // view role id

_vault write -f /auth/approle/role/\<role-name\>/secret-id_ // generate new secret id

### to log in with a specific approle

_rm -rf ~/.vault-token_ // remove the old token

_curl --request POST --data '{"role_id":"\<role-id\>","secret_id":"\<secret-id\>"}' \<vault-url\>/v1/auth/approle/login_ // get auth token



