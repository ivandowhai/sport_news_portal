#!/usr/bin/env bash
bin/rails webpacker:clobber
bin/rails webpacker:compile
bin/rails server