# action-forge-publish

This action allows you to upload your module to [Puppet Forge](https://forge.puppet.com/).

## Usage

To use the action add the following step to your workflow file (e.g. `.github/workflows/main.yml`)

```yaml
name: Build and publish to Puppet Forge

on:
 push:
  tags:
      - v[0-9]+.[0-9]+.[0-9]+

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - name: Get latest tag
      id: vars
      run: echo "{tag}=${GITHUB_REF:10}" >> $GITHUB_OUTPUT
    - name: Clone repository
      uses: actions/checkout@v4.1.1
      with:
        ref: ${{ steps.vars.outputs.tag }}
    - name: Build and publish module
      uses: barnumbirr/action-forge-publish@v2.14.0
      env:
       FORGE_API_KEY: ${{ secrets.FORGE_API_KEY }}
       REPOSITORY_URL: https://forgeapi.puppet.com/v3/releases
```

## License:

```
Copyright 2019-2024 Martin Simon

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```

## Buy me a coffee?

If you feel like buying me a coffee (or a beer?), donations are welcome:

```
BTC : bc1qq04jnuqqavpccfptmddqjkg7cuspy3new4sxq9
DOGE: DRBkryyau5CMxpBzVmrBAjK6dVdMZSBsuS
ETH : 0x2238A11856428b72E80D70Be8666729497059d95
LTC : MQwXsBrArLRHQzwQZAjJPNrxGS1uNDDKX6
```
