#!/bin/bash

num=$( wc -l )
echo | expr $num - 1 
