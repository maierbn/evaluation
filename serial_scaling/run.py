#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
import numpy as np
#import matplotlib.pyplot as plt
import subprocess


last_total = 0
f = 1
a = 1

for n in range(1,1000):
  x = np.round(n**(1./3))
  y = np.round((n/x)**(1./2))
  z = np.round(n/x/y)
  total = x*y*z
  
  if total == last_total:
    continue
 
  last_total = total

  print "x={0}, y={1}, z={2}, n={3}, total={4}".format(int(x),int(y),int(z),int(n),x*y*z)
  command = "$OPENCMISS_REL_DIR/cuboid $OPENCMISS_INPUT_DIR {0} {1} {2} {3} {4}"\
  .format(int(x),int(y),int(z),int(f),int(a))

  subprocess.check_call(command, shell=True)  
  
