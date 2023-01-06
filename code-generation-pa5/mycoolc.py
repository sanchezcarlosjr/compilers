# example run: python coolc.py stack.s atoi.s

import inspect, os, sys, shlex, platform

import subprocess
from subprocess import PIPE

import time, fnmatch

def assertUpToDate():
	if not os.path.exists("./timestamp"):
		msg = "Please recompile your Cgen ('ant cgen')."
		raise Exception(msg);

def executePass(cmd, windows, i, o):
	cmdList = shlex.split(cmd)
	return subprocess.Popen(cmdList, shell=windows, stdin=i,stdout=o)

def main(arg_str):
	if platform.system() == "Windows":
		windows=True
		sep=";"
	else:
		windows=False
		sep=":"

	assertUpToDate()

	script_file = inspect.getfile(inspect.currentframe())
	script_location = os.path.dirname(os.path.abspath(script_file)).replace("\\","/")
	classpath = "." + sep + script_location + "/coolc.jar"
	refclasspath = script_location + "/coolc.jar"

	opt = "-Djava.awt.headless=true"

	passes = ["Lexer", "Parser", "Semant", "Cgen"]
	mapper = lambda x: "java %s -cp \"%s\" %s %s" % (opt, refclasspath, x, arg_str)
	cmds = map(mapper, passes)

	cmds[3] = "java %s -cp \"%s\" Cgen %s" % (opt, classpath, arg_str)

	p1 = executePass(cmds[0], windows, None, PIPE)
	p2 = executePass(cmds[1], windows, p1.stdout, PIPE)
	p3 = executePass(cmds[2], windows, p2.stdout, PIPE)
	p4 = executePass(cmds[3], windows, p3.stdout, None)
	p4.wait()

if __name__ == "__main__":
	arglen = len(sys.argv)
	arg_str = ' '.join(sys.argv[1:arglen]).replace("\\","/")
	main(arg_str)
