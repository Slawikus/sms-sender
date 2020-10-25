#!/bin/bash

if [[ "$1" = "test" ]]; then
    bundle exec rake
else
    /code/bin/start
fi
