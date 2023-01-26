# compute-engine

## 公開鍵と秘密鍵の作成

```sh
$ ssh-keygen -t rsa -b 4096
Generating public/private rsa key pair.
Enter file in which to save the key (/home/zunda/.ssh/id_rsa): ./id_rsa
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in ./id_rsa
Your public key has been saved in ./id_rsa.pub
$
$ ls -l id_rsa id_rsa.pub
-rw------- 1 zunda zunda 3381 Jan 26 23:47 id_rsa
-rw-r--r-- 1 zunda zunda  739 Jan 26 23:47 id_rsa.pub
```
