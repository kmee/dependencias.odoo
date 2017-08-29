#!/bin/bash

sudo -u postgres createuser --createdb $(whoami)
createdb $(whoami)
