# ocadb
Connect to Oracle Cloud Autonomous Databases with Python SQLAlchemy

1. Download Oracle Instant Client for Linux x86-64 (64-bit):

https://www.oracle.com/database/technologies/instant-client/linux-x86-64-downloads.html

2. Download Wallet for your ADB instance:

https://cloud.oracle.com/db/adb/ > Select Instance > DB Connections > Download Wallet

3. Supply your database User, Password and DNS to the `.env` file

```
cp .env.example .env
nano .env
```

4. Supply driver and wallet path to `Makefile`: 
```
nano Makefile
```

5.  Build and run
```
make build
make run
```

6. Note:
Wallet files must replace the content of the `network/admin` directory in driver `LD_LIBRARY_PATH`.