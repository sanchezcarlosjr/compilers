import inspect, os, sys, shlex, platform

import subprocess
from subprocess import PIPE

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

	script_file = inspect.getfile(inspect.currentframe())
	script_location = os.path.dirname(os.path.abspath(script_file)).replace("\\","/")

	classpath = "." + sep + script_location + "/coolc.jar"
	opt = "-Djava.awt.headless=true"

	cmd1 = "java %s -cp \"%s\" SymtabExample %s" % (opt, classpath, arg_str)
	p1 = executePass(cmd1, windows, None, None)
	p1.wait()

if __name__ == "__main__":
	arglen = len(sys.argv)
	arg_str = ' '.join(sys.argv[1:arglen]).replace("\\","/")
	main(arg_str)   
