# Vault Configuration

## Start server
First, unset potential env var and create the `raft` storage backend.
```shell
$ unset VAULT_TOKEN
$ cd
$ mkdir -p vault/data
```

Then, use included HCL file to configure Vault. Note that `disable_mlock` is only `true` because our server has no swap. Also note that TLS is only disabled because of local network. Finally, set the `-config` flag and start the server.
```shell
$ vault server -config=~/github/edenlib/vault/config.hcl
```

## Configure Vault
Set env var.
```shell
$ export VAULT_ADDR='192.168.0.20:8200'
```

Initialize Vault.
```shell
$ vault operator init > ~/vault/operator_init
```

## Seal/Unseal Vault
Unseal with at least 3/5 keys.
```
$ vault operator unseal
```

When the value for `Sealed` changes to `false`, login with the initial root token.
```shell
$ vault login <Initial_Root_Token>
```

The Vault is now unsealed and ready to use.

## Clean up
Kill the Vault server.
```shell
$ ps aux | grep "vault server" | grep -v grep | awk '{print $2}' | xargs kill
```

Delete the storage backend which stores the encrypted Vault data.
```shell
$ rm -r ~/vault/data
```