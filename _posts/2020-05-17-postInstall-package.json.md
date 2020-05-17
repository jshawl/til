---
layout: post
title: Copy files from an npm package with postinstall script
---

I published an [npm package](https://www.npmjs.com/package/@jshawl/tsconfig) to quickly generate a new `tsconfig.json` file in a typescript project, which required copying files from the package to the current working directory.

To do this, I added:

```json
"postinstall": "cp -n tsconfig.json $INIT_CWD || echo 'error: refusing to overwrite existing tsconfig.json'"
```

to package.json. Works like a charm!
