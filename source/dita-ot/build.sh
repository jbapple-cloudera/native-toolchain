#!/usr/bin/env bash
# Copyright 2016 Cloudera Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# DITA Open Toolkit is a tool for rendering XML documentation to readable formats.

# To build the tarball for use with this build script:
#
# git clone --depth=1 -b 2.3.3 https://github.com/dita-ot/dita-ot.git
# cd dita-ot
# git submodule update --init --recursive
# cd ..
# tar -czf dita-ot-2.3.3.tar.gz dita-ot

set -euo pipefail

source $SOURCE_DIR/functions.sh
THIS_DIR="$(cd "$(dirname "$0")" && pwd)"
prepare $THIS_DIR

download_dependency $PACKAGE "${PACKAGE_STRING}.tar.gz" $THIS_DIR

if needs_build_package ; then
  header $PACKAGE $PACKAGE_VERSION
  wrap ./gradlew
  wrap cp -rf "$(pwd)/." "${LOCAL_INSTALL}"
  footer $PACKAGE $PACKAGE_VERSION
fi
