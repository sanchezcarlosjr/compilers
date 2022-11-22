import re
import mysemant, semant

import inspect, os, sys, shlex, platform

import subprocess
from subprocess import PIPE

import difflib, errno
       

def executePass(cmd, i, o):
	windows = (platform.system() == "Windows")
	cmdList = shlex.split(cmd)
	return subprocess.Popen(cmdList, shell=windows, stdin=i,stdout=o,stderr=subprocess.STDOUT)

def parse(parser_name, arg_str):
	cmd = "python %s %s" % (parser_name, arg_str)
	p = executePass(cmd, None, PIPE)
	return re.sub(r"#[0-9]*","#", p.communicate()[0]);

def removeIfExists(filename):
	try:
		os.remove(filename)
	except OSError as e:
		if e.errno != errno.ENOENT:
			raise

def main(arg_str):
	diff_file = "%s.diff"%(arg_str)
	removeIfExists(diff_file)

	out_ref = parse("semant.py", arg_str).splitlines()
	out_my = parse("mysemant.py", arg_str).splitlines()
	
	ref_cmd = "The reference"
	my_cmd = "Yours"
	
	diff = list(difflib.context_diff(out_ref, out_my, ref_cmd, my_cmd))

	if len(diff) != 0:
		with open("%s.diff"%(arg_str), 'w') as f:
			for l in diff:
				print >>f, l
		print "%s: fail"%(arg_str)
	else:
		print "%s: success"%(arg_str)

if __name__ == "__main__":
	arglen = len(sys.argv)
	arg_str = ' '.join(sys.argv[1:arglen]).replace("\\","/")
	main(arg_str)
