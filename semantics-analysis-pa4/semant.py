# example run: python runmips.py stack.s

import inspect, os, sys, shlex, platform

import subprocess
from subprocess import PIPE

def executePass(cmd, windows, i, o):
	cmdList = shlex.split(cmd)
	return subprocess.Popen(cmdList, shell=windows, stdin=i,stdout=o)

def main(arg_str):
	if platform.system() == "Windows":
		windows=True
	else:
		windows=False

	script_file = inspect.getfile(inspect.currentframe())
	script_location = os.path.dirname(os.path.abspath(script_file)).replace("\\","/")

	classpath = script_location + "/coolc.jar"
	opt = "-Djava.awt.headless=true"

	cmd1 = "java %s -cp \"%s\" Lexer %s" % (opt, classpath, arg_str)
	cmd2 = "java %s -cp \"%s\" Parser %s" % (opt, classpath, arg_str)
	cmd3 = "java %s -cp \"%s\" Semant %s" % (opt, classpath, arg_str)
	p1 = executePass(cmd1, windows, None, PIPE)
	p2 = executePass(cmd2, windows, p1.stdout, PIPE)
	p3 = executePass(cmd3, windows, p2.stdout, None)
	p3.wait()

if __name__ == "__main__":
	arglen = len(sys.argv)
	arg_str = ' '.join(sys.argv[1:arglen]).replace("\\","/")
	main(arg_str)
