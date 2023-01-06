import re
import coolc, mycoolc

import inspect, os, sys, shlex, platform

import subprocess
from subprocess import PIPE

import difflib, errno

def executePass(cmd, i, o, err):
	windows = (platform.system() == "Windows")
	cmdList = shlex.split(cmd)
	return subprocess.Popen(cmdList, shell=windows, stdin=i,stdout=o,stderr=err)

def compileAndRun(parser_name, tag, arg):
	sname = "%s.%s.s" % (arg,tag)

	cmd1 = "python %s %s -o %s" % (parser_name, arg, sname)
	p1 = executePass(cmd1, None, None, subprocess.STDOUT)

	cmd2 = "python runmips.py %s" % (sname)
	p2 = executePass(cmd2, None, PIPE, subprocess.STDOUT)
	result = p2.communicate()[0];
	f2 = open("%s.out.%s" % (arg,tag), 'w')
	print >>f2, result;
	return result;

def removeIfExists(filename):
	try:
		os.remove(filename)
	except OSError as e:
		if e.errno != errno.ENOENT:
			raise

def main(arg):
	diff_file = "%s.diff"%(arg)
	removeIfExists(diff_file)

	out_ref = compileAndRun("coolc.py", "ref", arg).splitlines()
	out_my = compileAndRun("mycoolc.py", "my", arg).splitlines()

	ref_cmd = "The reference"
	my_cmd = "Yours"
	
	diff = list(difflib.context_diff(out_ref, out_my, ref_cmd, my_cmd))

	if len(diff) != 0:
		with open("%s.diff"%(arg), 'w') as f:
			for l in diff:
				print >>f, l
		print "%s: fail"%(arg)
	else:
		print "%s: success"%(arg)

if __name__ == "__main__":
	arglen = len(sys.argv)
	arg1 = sys.argv[1].replace("\\","/")
	main(arg1)
