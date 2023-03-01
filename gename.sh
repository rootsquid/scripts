#Generates a random username quickly
if [ -f 'namess.txt' ]
then
    max=$(wc -l names.txt | awk '{print $1}')
    random=$(shuf -i 1-$max -n 1)
    name=$(sed -n "$random p" names.txt)
    random=$(shuf -i 1-1000 -n 1)
    name="$name$random"
else
    echo "File names.txt does not exist, grabbing it from github..."
    max=$(curl -s https://raw.githubusercontent.com/rootsquid/docs/main/firstnames | wc -l)
    random=$(shuf -i 1-$max -n 1)
    name=$(curl -s https://raw.githubusercontent.com/rootsquid/docs/main/firstnames | sed -n "$random p")
    random=$(shuf -i 1-1000 -n 1)
    name="$name$random"    
fi
    echo "Your generated username is: $name"
    