#提交修改
git add .
echo 'input commits:'
read input
git commit -m $input

#查看状态
git status
echo 'push or not?'

read pushOrNot
if [$pushOrNot='n']
then
	exit
else
	echo '\n start push ...... \n' 
fi

#推送到远程
git push origin main



