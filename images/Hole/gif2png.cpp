#include <iostream>
#include <cstdlib>
#include <string>
using namespace std;
int main(){
	int num;
	int numer = 0;
	string str;
	cout << "Введитете количество картинок\n";
	cin >> num;

	
	while(numer < num)
	{
		string s = std::to_string(numer);

		str = "convert -verbose -coalesce " + s + ".gif " + s + ".png";
		char *cstr = &str[0u];
		system(cstr);
		numer++;
	}
	return 0;
}
