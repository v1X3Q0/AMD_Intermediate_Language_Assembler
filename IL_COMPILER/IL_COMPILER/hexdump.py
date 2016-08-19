import sys
def main():
	if len(sys.argv) < 2:
		return
	f = open(sys.argv[1])
	g = f.read()
	count = 0
	line = 0
	temp_s = ""
	temp_l = ""
	if len(g) % 4 != 0:
		print 'align file'
		return
	for i in g:
		if count == 4:
			count = 0
			line += 1
			temp_l += ' ' + temp_s
			temp_s = ""
		if line == 4:
			print temp_l
			temp_l = ""
			line = 0
		spot = hex(ord(i))[2:]
		if len(spot) < 2:
			temp_s = '0' + spot + temp_s
		else:
			temp_s = hex(ord(i))[2:] + temp_s
		count = count + 1
	temp_l += ' ' + temp_s
	print temp_l
	f.close()
if __name__ == '__main__':
	main()