# ZHANGSHIELD :dragon: :lizard:

![Zhangshield CI](https://github.com/alyxshang/zhangshield/actions/workflows/zig.yml/badge.svg)

***A Zig package to measure the security of passwords. :dragon: :lizard:***

## ABOUT :books:

This repository contains the source code for a package for the Zig
programming language to measure the security of your passwords. The
algorithm used is called the ***Shangshield*** algorithm. Because this
is a package for the ***Z***ig programming language I named it
***Zhangshield***.

## INSTALLATION :inbox_tray:

To use the ***Zhangshield*** package in your Zig project, run the following command
from the root of your Zig project:

```bash
zig fetch --save git+https://github.com/alyxshang/zhangshield.git
``` 

This will add the ***Zhangshield*** package to your `build.zig.zon` file.

To also inform the compiler about this new package you would have to also add this library to your `build.zig` build script. To use the ***Zhangshield*** namespace in your Zig code, you would add the following line to any Zig source code files you want to use this
package in:

```Zig
const zhangshield = @import("zhangshield");
```

## USAGE :hammer:

To view this package's API please clone this repository and run the command `zig build-lib -femit-docs src/root.zig` from the repository's root or view them [here](https://alyxshang.github.io/zhangshield).

## CHANGELOG :black_nib:

### Version 0.1.0

- Initial release.
- Upload to GitHub.

## NOTE :scroll:

- *Zhangshield :dragon: :lizard:* by *Alyx Shang :black_heart:*.
- Licensed under the [FSL v1](https://github.com/alyxshang/fair-software-license).
