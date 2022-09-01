# example run: python coolc.py stack.s atoi.s

import inspect, os, sys, shlex, platform

import subprocess
from subprocess import PIPE

def executePass(cmd, windows, i, o):
	cmdList = shlex.split(cmd)
	return subprocess.Popen(cmdList, shell=windows, stdin=i,stdout=o)

if platform.system() == "Windows":
	windows=True
else:
	windows=False

arglen = len(sys.argv)
arg_str = ' '.join(sys.argv[1:arglen]).replace("\\","/")

script_file = inspect.getfile(inspect.currentframe())
script_location = os.path.dirname(os.path.abspath(script_file)).replace("\\","/")
classpath = script_location + "/coolc.jar"

opt = "-Djava.awt.headless=true"

passes = ["Lexer", "Parser", "Semant", "Cgen"]
mapper = lambda x: "java %s -cp \"%s\" %s %s" % (opt, classpath, x, arg_str)
cmds = map(mapper, passes)

p1 = executePass(cmds[0], windows, None, PIPE)
p2 = executePass(cmds[1], windows, p1.stdout, PIPE)
p3 = executePass(cmds[2], windows, p2.stdout, PIPE)
p4 = executePass(cmds[3], windows, p3.stdout, None)
p4.wait()
