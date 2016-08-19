#include "il_enum_head.h"
#include <iostream>
#include <windows.h>
#include <fstream>
#include <string>
#include <sstream>
#include <vector>
#include <list>
using namespace std;
vector<string> getSubString(string str_, char delim = 'a', char delim2 = 'a', char delim3 = 'a')
{
	string j = "";
	vector<string> k;
	for (DWORD i = 0; i < str_.length(); i++)
	{
		if (isalnum(str_[i]) || (str_[i] == delim) || (str_[i] == delim2) || (str_[i] == delim3))
			j.push_back(str_[i]);
		else
		{
			if (j != "")
				k.push_back(j);
			j = "";
		}
	}
	if (j != "")
		k.push_back(j);
	return k;
}
void outFile(ofstream* outfile, DWORD m)
{
	for (int i = 0; i < 4; i++)
	{
		char n = (m >> (i * 8)) % 256;
		(*outfile) << n;
	}
}
DWORD count_(string str_, char thing)
{
	DWORD count = 0;
	while (str_.find(thing) != -1)
	{
		str_.erase(str_.find(thing), 1);
		count++;
	}
	return count;
}
DWORD getMask(string str_)
{
	DWORD mask_ = 0;
	int sz_ = str_.size();
	if ((str_.find('x') != -1) && (str_.find('r') != -1))
	{
		if ((str_.find('y') != -1) && (str_.find('g') != -1))
		{
			if ((str_.find('z') != -1) && (str_.find('b') != -1))
			{
				if ((str_.find('w') != -1) && (str_.find('a') != -1))
				{
					int j = 0;
					for (string::iterator i = str_.begin(); i != str_.end(); j++, i++)
					{
						if (*i == '_')
							mask_ |= IL_MODCOMP_NOWRITE << (j * 2);
						else
							mask_ |= (atoi(&(*i)) + IL_MODCOMP_0) << (j * 2);
					}
				}
				else
				{
					int j = 0;
					for (string::iterator i = str_.begin(); i != str_.end(); j++, i++)
					{
						if ((*i == 'w') || (*i == 'a'))
						{
							mask_ = mask_ << (2 * (3 - j));
							mask_ |= IL_MODCOMP_WRITE << 6;
						}
						else if (*i == '_')
							mask_ |= IL_MODCOMP_NOWRITE << (j * 2);
						else
							mask_ |= (atoi(&(*i)) + IL_MODCOMP_0) << (j * 2);
					}
				}
			}
			else
			{
				int j = 0;
				for (string::iterator i = str_.begin(); i != str_.end(); j++, i++)
				{
					if ((*i == 'z') || (*i == 'b'))
					{
						mask_ = mask_ << (2 * (2 - j));
						j = 2;
						mask_ |= IL_MODCOMP_WRITE << 4;
					}
					else if ((*i == 'w') || (*i == 'a'))
						mask_ |= IL_MODCOMP_WRITE << (j * 2);
					else if (*i == '_')
						mask_ |= IL_MODCOMP_NOWRITE << (j * 2);
					else
						mask_ |= (atoi(&(*i)) + IL_MODCOMP_0) << (j * 2);
				}
			}
		}
		else
		{
			int j = 0;
			for (string::iterator i = str_.begin(); i != str_.end(); j++, i++)
			{
				if ((*i == 'y') || (*i == 'g'))
				{
					mask_ = mask_ << (2 * (1 - j));
					j = 1;
					mask_ |= IL_MODCOMP_WRITE << 2;
				}
				else if ((*i == 'z') || (*i == 'b'))
					mask_ |= IL_MODCOMP_WRITE << (j * 2);
				else if ((*i == 'w') || (*i == 'a'))
					mask_ |= IL_MODCOMP_WRITE << (j * 2);
				else if (*i == '_')
					mask_ |= IL_MODCOMP_NOWRITE << (j * 2);
				else
					mask_ |= (atoi(&(*i)) + IL_MODCOMP_0) << (j * 2);
			}
		}
	}
	else
	{
		int j = 0;
		for (string::iterator i = str_.begin(); i != str_.end(); j++, i++)
		{
			if (isalpha(*i))
				mask_ |= IL_MODCOMP_WRITE << (j * 2);
			else if (*i == '_')
				mask_ |= IL_MODCOMP_NOWRITE << (j * 2);
			else
				mask_ |= (atoi(&(*i)) + IL_MODCOMP_0) << (j * 2);
		}
	}
	return mask_;
}
DWORD getSwizzle(string str_)
{
	DWORD swiz_ = 0;
	int j = 0;
	if (str_.size() == 1)
		for (int i = 0; i < 3; i++)
			str_.push_back(str_[0]);
	for (string::iterator i = str_.begin(); i != str_.end(); i++, j++)
	{
		if ((*i == 'x') || (*i == 'r'))
			swiz_ |= IL_COMPSEL_X_R << (j * 4);
		else if ((*i == 'y') || (*i == 'g'))
			swiz_ |= IL_COMPSEL_Y_G << (j * 4);
		else if ((*i == 'z') || (*i == 'b'))
			swiz_ |= IL_COMPSEL_Z_B << (j * 4);
		else if ((*i == 'w') || (*i == 'a'))
			swiz_ |= IL_COMPSEL_W_A << (j * 4);
		else
			swiz_ |= (atoi(&(*i)) + IL_COMPSEL_0) << (j * 4);
	}
	if (-1 != str_.find("neg"))
	{
		str_.erase(0, str_.find("(") + 1);
		str_.erase(str_.find(")"), 1);
		if (-1 != str_.find("x"))
			swiz_ |= 1 << 3;
		else if (-1 != str_.find("y"))
			swiz_ |= 1 << 7;
		else if (-1 != str_.find("z"))
			swiz_ |= 1 << 11;
		else if (-1 != str_.find("w"))
			swiz_ |= 1 << 15;
	}
	return swiz_;
}
DWORD isReg(string reg)
{
	DWORD ret_ = 0;
	if (0 == reg.find("mem"))
		return IL_REGTYPE_GENERIC_MEM << 16;
	else if (0 == reg.find("vThreadGrpIDFlat"))
		return IL_REGTYPE_THREAD_GROUP_ID_FLAT << 16;
	else if (0 == reg.find("vTidInGrpFlat"))
		return IL_REGTYPE_THREAD_ID_IN_GROUP_FLAT << 16;
	else if (0 == reg.find("vTidInGrp"))
		return IL_REGTYPE_THREAD_ID_IN_GROUP << 16;
	switch (reg[0])
	{
	case 'v':
		ret_ = IL_REGTYPE_INPUT;
		break;
	case 'r':
		ret_ = IL_REGTYPE_TEMP;
		break;
	case 'o':
		ret_ = IL_REGTYPE_OUTPUT;
		break;
	case 'c':
		ret_ = IL_REGTYPE_CONST_BUFF;
		break;
	case 'l':
		ret_ = IL_REGTYPE_LITERAL;
		break;
	default:
		return IL_REGTYPE_LAST;
	}
	ret_ = ret_ << 16;
	return ret_;
}
bool conalpha(string str_)
{
	for (string::iterator i = str_.begin(); i != str_.end(); i++)
		if (!isalpha(*i))
			return false;
	return true;
}
DWORD getReg(ofstream* outfile, string &str_, char type = 0)
{// 0 is dst, 1 is src, 2 is subsrc
	int ret_ = 0;
	string mod = "";
	DWORD immediates = count_(str_, '[');
	string reg = getSubString(str_)[0];
	int reg_num = -1;
	{
		string num = "";
		for (int i = 0; i < reg.size(); i++)
		{
			if (isalnum(reg[i]))
				if (!isalpha(reg[i]))
				{
					num += reg[i];
					reg.erase(i, 1);
					i--;
				}
		}
		if (num != "")
		{
			reg_num = atoi(num.c_str());
			ret_ |= reg_num;
		}
	}
	ret_ |= isReg(reg);
	vector<string> param;
	param.clear();
	{
		string temp = str_;
		while (immediates)
		{
			string temp_ = str_.substr(str_.find('[') + 1, str_.find(']') - str_.find('[') - 1);
			temp.erase(str_.find('['), str_.find(']') - str_.find('[') + 1);
			param.push_back(temp_);
			immediates--;
		}
		if (getSubString(temp).size() > 1)
		{
			ret_ |= 1 << 22;
			if (-1 != temp.find('.'))
				temp.erase(0, temp.find('.') + 1);
			else
				temp.erase(0, temp.find('_') + 1);
			mod = temp;//getSubString(temp, '_')[1];
		}
	}
	immediates = param.size();
	if (reg_num == -1)
	{
		if (conalpha(param[0]))
		{
			reg_num = 0;
			ret_ |= IL_ADDR_REG_RELATIVE << 23;
		}
		else //(immediates == 2)
		{
			reg_num = atoi(param[0].c_str());
			ret_ |= 1 << 25;//dimension
		}
	}
	if (immediates == 0)
	{
	}
	if (immediates == 1)
	{
		if (conalpha(param[0]))
			ret_ |= IL_ADDR_REG_RELATIVE << 23;
		else
			ret_ |= IL_ADDR_ABSOLUTE << 23;
	}
	if (immediates == 2)
	{
		ret_ |= IL_ADDR_REG_RELATIVE << 23;
		ret_ |= 1 << 25;		//dimension
	}
	if (immediates != 0 && type != 2)
		ret_ |= 1 << 26;	//immediate
	outFile(outfile, ret_);
	if (mod != "")
	{
		if (type == 0)
			outFile(outfile, getMask(mod));
		else
			outFile(outfile, getSwizzle(mod));
	}
	for (int i = 0; i < immediates; i++)
	{
		if (type == 2)
			outFile(outfile, atoi(param[0].c_str()));
		else if (conalpha(param[i]))
		{
			if (immediates == 1)
			{
				DWORD imm_ = 1 << 26;
				outFile(outfile, imm_);
			}
			int buf = param[i].find('+');
			if (buf != -1)
			{
				string temp = param[i].substr(buf + 1, param[i].size() - buf + 1);
				param[i] = getSubString(param[i], '_', '.')[0];
				string temp2 = getSubString(param[i], '_')[1];
				param[i] = getSubString(param[i])[0] + "[" + temp + "]." + temp2; 
			}
			getReg(outfile, param[i], 2);
		}
		else if (!conalpha(param[i]) && (reg_num != -1))
			outFile(outfile, atoi(param[i].c_str()));
	}
	return ret_;
}
void dstRegOp(string str_, ofstream* outfile)
{
	DWORD dst = 0;
	vector<string> vec = getSubString(str_, '_');
	dst = isReg(vec[0]);
	dst |= atoi(vec[0].c_str());
	if (vec.size() > 1) //then there is a mask
	{
		dst |= 1 << 22;
		outFile(outfile, dst);
		dst = getMask(vec[1]);
	}
	outFile(outfile, dst);
}
void srcRegOp(string str_, ofstream* outfile)
{
	DWORD src = 0;
	vector<string> vec;
	vec = getSubString(str_, '_');
	src = isReg(vec[0]);
	src |= (atoi(vec[0].c_str()));
	if ((str_.find('.') == -1) && (str_.find('_') == -1))
	{
		vec.clear();
	}
	else if (str_.find('.') == -1) //some operation will be performed
	{

	}
	else // swizzle
	{
		src |= 1 << 22;
		outFile(outfile, src);
		src = getSwizzle(vec[1]);
	}
	outFile(outfile, src);
}

int main(int argc, char** argv)
{
	string line;
	ifstream infile(argv[1]);
	if (!infile.is_open())
	{
		cout << "no file\n";
		return -1;
	}
	string outfile_n = argv[1];
	outfile_n += ".bin";
	ofstream outfile;
	outfile.open(outfile_n, ios::binary);
	while (getline(infile, line))
	{
		istringstream tokens(line);
		string token;
		DWORD out_tok = 0;
		while (tokens >> token)
		{
			vector<string> str_ = getSubString(token);
			if (str_[0] == "il")
			{
				if (str_[1] == "vs")
					out_tok |= IL_LANG_DX11_VS;
				else if (str_[1] == "ps")
					out_tok |= IL_LANG_DX11_PS;
				else if (str_[1] == "cs")
					out_tok |= IL_LANG_DX11_CS;
				outFile(&outfile, out_tok);
				out_tok = 0;
				out_tok |= atoi(str_[2].c_str()) << 8;
				out_tok |= atoi(str_[3].c_str()) << 0;
				if (str_[1] == "vs")
					out_tok |= IL_SHADER_VERTEX << 16;
				else if (str_[1] == "ps")
					out_tok |= IL_SHADER_PIXEL << 16;
				else if (str_[1] == "cs")
					out_tok |= IL_SHADER_COMPUTE << 16;
				outFile(&outfile, out_tok);
			}
			else if (str_[0] == "dcl")
			{
				if (str_[1] == "input")
				{
					out_tok |= IL_DCL_INPUT;
					if (str_.size() > 2)
					{
						if (str_[2] == "generic")
						{
							out_tok |= (IL_IMPORTUSAGE_GENERIC << 16);
							if (str_.size() > 3)
							{
								if (str_[4] == "linear")
									out_tok |= (IL_INTERPMODE_LINEAR << 21);
								else if (str_[4] == "constant")
									out_tok |= (IL_INTERPMODE_CONSTANT << 21);
							}
						}
						else if (str_[2] == "vertexid")
							out_tok |= (IL_IMPORTUSAGE_VERTEXID << 16);
					}
					else
						out_tok |= (IL_IMPORTUSAGE_GENERIC << 16);
					outFile(&outfile, out_tok);
					tokens >> token;
					getReg(&outfile, token);
				}
				else if (str_[1] == "output")
				{
					out_tok |= IL_DCL_OUTPUT;
					if (str_.size() > 2)
					{
						if (str_[2] == "generic")
							out_tok |= (IL_IMPORTUSAGE_GENERIC << 16);
						else if (str_[2] == "position")
							out_tok |= (IL_IMPORTUSAGE_POS << 16);
					}
					outFile(&outfile, out_tok);
					tokens >> token;
					getReg(&outfile, token);
				}
				else if (str_[1] == "global")
				{
					out_tok |= IL_DCL_GLOBAL_FLAGS;
					while (tokens >> token)
					{
						if (token == "refactoringAllowed")
							out_tok |= 1 << 16;
					}
					outFile(&outfile, out_tok);
					break;
				}
				else if (str_[1] == "resource")
				{
					out_tok |= IL_DCL_RESOURCE;
					out_tok |= atoi(str_[3].c_str()) << 16;
					if (str_[5] == "buffer")
						out_tok |= IL_USAGE_PIXTEX_BUFFER << 24;
					else if (str_[5] == "2d")
						out_tok |= IL_USAGE_PIXTEX_2D << 24;
					if (str_[6] == "unorm")
						out_tok |= 1 << 31;
					outFile(&outfile, out_tok);
					out_tok = 0;
					for (int i = 0; i < 4; i++)
					{
						if (str_[str_.size() - 1 - i * 2] == "float")
							out_tok |= IL_ELEMENTFORMAT_FLOAT << (29 - i * 3);
					}
					outFile(&outfile, out_tok);
				}
				else if (str_[1] == "cb")
				{
					out_tok |= IL_DCL_CONST_BUFFER;
					//if (getSubString(line, '[', ']').size() > 1)
					//	out_tok |= 1 << 31;
					outFile(&outfile, out_tok);
					tokens >> token;
					getReg(&outfile, token, 1);
				}
				else if (str_[1] == "struct")
				{
					if (str_[2] == "srv")
						out_tok = IL_OP_DCL_STRUCT_SRV;
					else if (str_[2] == "uav")
						out_tok = IL_OP_DCL_STRUCT_UAV;
					out_tok |= atoi(str_[4].c_str()) << 16;
					outFile(&outfile, out_tok);
					tokens >> token;
					out_tok = atoi(token.c_str());
					outFile(&outfile, out_tok);
				}
				else if (str_[1] == "num")
				{
					if (str_[2] == "thread")
					{
						out_tok = IL_OP_DCL_NUM_THREAD_PER_GROUP;
						out_tok |= 3 << 16;
						outFile(&outfile, out_tok);
						unsigned count = 0;
						while (tokens >> token)
						{
							out_tok = atoi(getSubString(token)[0].c_str());
							outFile(&outfile, out_tok);
							count++;
						}
						while (count++ < 3)
							outFile(&outfile, 1);
					}
				}
				else if (str_[1] == "literal")
				{
					out_tok = IL_DCL_LITERAL;
					outFile(&outfile, out_tok);
					tokens >> token;
					getReg(&outfile, token, 1);
					for (int i = 0; i < 4; i++)
					{
						tokens >> token;
						out_tok = atoi(getSubString(token)[0].c_str());
						outFile(&outfile, out_tok);
					}
				}
			}
			else if (str_[0] == "uav")
			{
				if (str_[1] == "struct")
				{
					if (str_[2] == "load")
						out_tok = IL_OP_UAV_STRUCT_LOAD;
					else if (str_[2] == "store")
						out_tok = IL_OP_UAV_STRUCT_STORE;
					out_tok |= atoi(str_[4].c_str()) << 16;
					outFile(&outfile, out_tok);
					tokens >> token;
					getReg(&outfile, token);
					tokens >> token;
					getReg(&outfile, token, 1);
				}
			}
			else if (str_[0] == "sample")
			{
				out_tok = IL_OP_SAMPLE;
				out_tok |= atoi(str_[2].c_str()) << 16;
				out_tok |= atoi(str_[4].c_str()) << 24;
				outFile(&outfile, out_tok);
				tokens >> token;
				getReg(&outfile, token);
				tokens >> token;
				getReg(&outfile, token, 1);
			}
			else if (str_[0] == "dp2")
			{
				out_tok |= IL_OP_DP2;
				if (str_.size() > 1)
					out_tok |= 1 << 16;
				outFile(&outfile, out_tok);
				tokens >> token;
				getReg(&outfile, token);
				tokens >> token;
				getReg(&outfile, token, 1);
				tokens >> token;
				getReg(&outfile, token, 1);
			}
			else if (str_[0] == "dp4")
			{
				out_tok |= IL_OP_DP4;
				if (str_.size() > 1)
					out_tok |= 1 << 16;
				outFile(&outfile, out_tok);
				tokens >> token;
				getReg(&outfile, token);
				tokens >> token;
				getReg(&outfile, token, 1);
				tokens >> token;
				getReg(&outfile, token, 1);
			}
			else if (str_[0] == "dp3")
			{
				out_tok |= IL_OP_DP3;
				if (str_.size() > 1)
					out_tok |= 1 << 16;
				outFile(&outfile, out_tok);
				tokens >> token;
				getReg(&outfile, token);
				tokens >> token;
				getReg(&outfile, token, 1);
				tokens >> token;
				getReg(&outfile, token, 1);
			}
			else if (str_[0] == "mov")
			{
				out_tok |= IL_OP_MOV;
				outFile(&outfile, out_tok);
				tokens >> token;
				string k = token;
				if ((getSubString(token, '_', '[').size() == 1) && ((isReg(k) & (IL_REGTYPE_OUTPUT << 16)) != 0))
					token += ".xyzw";
				getReg(&outfile, token);
				tokens >> token;
				k = token;
				if ((token.find('.') == -1) && (token.find('_') == -1) && ((isReg(k) & (IL_REGTYPE_TEMP << 16)) != 0))
					token += ".xyzw";
				getReg(&outfile, token, 1);
			}
			else if (str_[0] == "mul")
			{
				out_tok = IL_OP_MUL;
				if (str_.size() > 1)
					out_tok |= 1 << 16;
				outFile(&outfile, out_tok);
				tokens >> token;
				getReg(&outfile, token);
				tokens >> token;
				getReg(&outfile, token, 1);
				tokens >> token;
				getReg(&outfile, token, 1);
			}
			else if (str_[0] == "mad")
			{
				out_tok = IL_OP_MAD;
				if (str_.size() > 1)
					out_tok |= 1 << 16;
				outFile(&outfile, out_tok);
				tokens >> token;
				getReg(&outfile, token);
				tokens >> token;
				getReg(&outfile, token, 1);
				tokens >> token;
				getReg(&outfile, token, 1);
				tokens >> token;
				getReg(&outfile, token, 1);
			}
			else if (str_[0] == "load")
			{
				if (str_[1] == "resource" || str_[1] == "ext")
				{
					out_tok |= IL_OP_LOAD;
					if (str_[1] == "resource")
					{
						out_tok |= atoi(str_[2].c_str()) << 16;
						if (str_[3] != "aoffimmi")
						{
							out_tok |= atoi(str_[4].c_str()) << 24;
						}
					}
					outFile(&outfile, out_tok);
					//get ready for operands, first is destination
					//then source.
					tokens >> token;
					getReg(&outfile, token);
					tokens >> token;
					getReg(&outfile, token, 1);
				}
			}
			else if (str_[0] == "iadd")
			{
				out_tok = IL_OP_I_ADD;
				outFile(&outfile, out_tok);
				tokens >> token;
				getReg(&outfile, token);
				tokens >> token;
				getReg(&outfile, token, 1);
				tokens >> token;
				getReg(&outfile, token, 1);
			}
			else if (str_[0] == "imul")
			{
				out_tok = IL_OP_I_MUL;
				outFile(&outfile, out_tok);
				tokens >> token;
				getReg(&outfile, token);
				tokens >> token;
				getReg(&outfile, token, 1);
				tokens >> token;
				getReg(&outfile, token, 1);
			}
			else if (str_[0] == "imad")
			{
				out_tok = IL_OP_I_MAD;
				outFile(&outfile, out_tok);
				tokens >> token;
				getReg(&outfile, token);
				tokens >> token;
				getReg(&outfile, token, 1);
				tokens >> token;
				getReg(&outfile, token, 1);
				tokens >> token;
				getReg(&outfile, token, 1);
			}
			else if (str_[0] == "sqrt")
			{
				out_tok = IL_OP_SQRT;
				outFile(&outfile, out_tok);
				tokens >> token;
				getReg(&outfile, token);
				tokens >> token;
				getReg(&outfile, token, 1);
			}
			else if (str_[0] == "rsq")
			{
				if (str_.size() > 1)
					if (str_[1] == "vec")
					{
						out_tok = IL_OP_RSQ_VEC;
						outFile(&outfile, out_tok);
						tokens >> token;
						getReg(&outfile, token);
						tokens >> token;
						getReg(&outfile, token, 1);
					}
			}
			else if (str_[0] == "umod")
			{
				out_tok = IL_OP_U_MOD;
				outFile(&outfile, out_tok);
				tokens >> token;
				getReg(&outfile, token);
				tokens >> token;
				getReg(&outfile, token, 1);
				tokens >> token;
				getReg(&outfile, token, 1);
			}
			else if (str_[0] == "udiv")
			{
				out_tok = IL_OP_U_DIV;
				outFile(&outfile, out_tok);
				tokens >> token;
				getReg(&outfile, token);
				tokens >> token;
				getReg(&outfile, token, 1);
				tokens >> token;
				getReg(&outfile, token, 1);
			}
			else if (str_[0] == "uge")
			{
				out_tok = IL_OP_U_GE;
				outFile(&outfile, out_tok);
				tokens >> token;
				getReg(&outfile, token);
				tokens >> token;
				getReg(&outfile, token, 1);
				tokens >> token;
				getReg(&outfile, token, 1);
			}
			else if (str_[0] == "break")
			{
				if (str_[1] == "logicalnz")
					out_tok = IL_OP_BREAK_LOGICALNZ;
				else if (str_[1] == "logicalz")
					out_tok = IL_OP_BREAK_LOGICALZ;
				outFile(&outfile, out_tok);
				tokens >> token;
				getReg(&outfile, token, 1);
			}
			else if (str_[0] == "endloop")
			{
				out_tok = IL_OP_ENDLOOP;
				outFile(&outfile, out_tok);
			}
			else if (str_[0] == "whileloop")
			{
				out_tok = IL_OP_WHILE;
				outFile(&outfile, out_tok);
			}
			else if (str_[0] == "ret")
			{
				if (str_.size() > 1)
				{
					if (str_[1] == "dyn")
						out_tok |= IL_OP_RET_DYN;
				}
				else
					out_tok |= IL_OP_RET;
				outFile(&outfile, out_tok);
			}
			else if (str_[0] == "end")
			{
				out_tok |= IL_OP_END;
				outFile(&outfile, out_tok);
			}
		}
	}
	outfile.close();
	return 0;
}
