# example run: python runmips.py stack.s

import inspect, os, sys, shlex, platform
import subprocess

def executePass(cmd, windows, i, o):
	cmdList = shlex.split(cmd)
	return subprocess.Popen(cmdList, shell=windows, stdin=i,stdout=o)

if platform.system() == "Windows":
	windows=True
else:
	windows=False

arglen = len(sys.argv)
arg_str = ' '.join(sys.argv[1:arglen])

script_file = inspect.getfile(inspect.currentframe())
script_location = os.path.dirname(os.path.abspath(script_file)).replace("\\","/")

classpath = script_location + "/coolc.jar"
mips_handler = script_location + "/trap_handler.mars"
opt = "-Djava.awt.headless=true"

cmd = "java %s -cp \"%s\" Mars me sm \"%s\" %s" % (opt, classpath, mips_handler, arg_str)
p = executePass(cmd, windows, None, None)
p.wait()
