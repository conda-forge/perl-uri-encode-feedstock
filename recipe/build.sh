#!/bin/bash

# If it has Build.PL use that, otherwise use Makefile.PL
if [ -f Build.PL ]; then
    perl Build.PL
    perl ./Build
    perl ./Build test
    # Make sure this goes in vendor
    perl ./Build install --installdirs vendor
elif [ -f Makefile.PL ]; then
    # Make sure this goes in vendor
    perl Makefile.PL INSTALLDIRS=vendor
    make
    make test
    make install
else
    echo 'Unable to find Build.PL or Makefile.PL. You need to modify build.sh.'
    exit 1
fi