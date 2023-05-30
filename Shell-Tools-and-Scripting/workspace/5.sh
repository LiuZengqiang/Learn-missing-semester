#!/bin/bash
find . -type f | xargs -d '\n' ls -lt
