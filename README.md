# The Create a Frozen Micropython Module Action
This GitHub Action [freezes custom micropython modules](http://docs.micropython.org/en/v1.9.3/unix/reference/constrained.html?highlight=frozen%20module) into micropython. Currently, only the `rp2` port (and the output filetype `.uf2`) is supported.

## Usage
The required inputs are...

* `module`: The name of your custom module
* `path`: The path to the module within your repository (in case it's in a subdirectory). (default is `.`)
* `port`: The micropython port to use (default is `rp2`, and only `rp2` is supported)
* `filename`: The filename of the resulting firmware (default is `firmware.uf2`, and only `.uf2` files are currently support)

#### Example Workflow
When a tag is pushed, this workflow builds the frozen module and creates a release (with the firmware as an asset).

```yaml
name: Build and Release

on:
  workflow_dispatch:
  push:
    tags:
      - '*'

jobs:
  Build-and-Release:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      
      - name: Build Firmware
        uses: jsimonrichard/freeze-micropython-module@main
        with:
          module: "mymodule"
          path: "./mymodule"
          port: "rp2"
          filename: "mymodule-firmware.uf2"


      - name: Upload Release
        uses: ncipollo/release-action@v1
        with:
          artifacts: 'mymodule-firmware.uf2'
          token: ${{ secrets.GITHUB_TOKEN }}
```

## Contributing

Pull requests are welcome. If you're using a port that this action doesn't support and you have the time, I'd really appreciate help with expanding the number of ports this repository supports.
