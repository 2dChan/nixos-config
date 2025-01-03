#!/usr/bin/env bash
tofi-drun --drun-launch=false | xargs -I {} sh -c {}
