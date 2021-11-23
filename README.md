### minimum package.json

```json
{
  "name": "app",
  "version": "0.0.1",
  "private": true,
  "dependencies": {
    "rescript": "^9.1.4"
  }
}
```

### cp command

```
$ cp -aRf 00-templates 01-express-sample
or
$ rsync -a --exclude 'node_modules' ./01-express-sample/ ./02-hotreload-express/
$ mv ./01-express-sample/node_modules ./02-hotreload-express/
```
