#!/bin/bash

# probably could be done more efficiently with a list & loop in the future

if [ -z "$GIT_AUTHOR_NAME" == "true" ]; then
  :
else
  git config --global user.name=$GIT_AUTHOR_NAME
fi

if [ -z "$GIT_AUTHOR_EMAIL" == "true" ]; then
  :
else
  git config --global user.name=$GIT_AUTHOR_EMAIL
fi
