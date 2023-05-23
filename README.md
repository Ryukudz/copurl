# copurl
I have a wordlist containing scope of the target (host or urls.), i want to browse each one of them one by one, 
i use this script to simply copy the host i want browse fast. (yea i get that lazy lol)

- this script will also create a new file that numbers the lines of your existing file e.g if you provided test.txt it will output test-numbered.txt which contains the content of your existing file but just with lines numbered.

# Install
```sh
#install xclip (Xclip facilitates seamless clipboard control and content management in Linux.)
sudo apt install xclip
git clone https://github.com/Ryukudz/copurl.git
cd copurl
chmod +x copurl.sh
```
# Usage
```
./copurl sh test.txt 3
#How i use it: I place it in /usr/local/bin/ and rename it c to simply use it as c <wordlist> <line>
```

