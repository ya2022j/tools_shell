前几天数据集放反了导致损失函数的两个参数维度不匹配而报错，第一反应是写python来解决这个问题。后来用了Linux的指令也解决了这个问题，以后应该会经常用到，记录一下：

1、找到某些特定命名的文件并移动（参数：①所在文件夹名/mnt/portrait-matting-unet-flask/data/temp②移动的目标文件夹./outdir

find /mnt/portrait-matting-unet-flask/data/temp -name "*_matte*" | xargs -I file  mv file ./outdir
2、移动指定数量文件数，|head -n10000: 移动indir中前10000文件

ls indir |head -n10000 | xargs -I file  mv file outdir
3、移动某文件夹下的文件到目标文件夹

ls indir | xargs -I file  mv file outdir





ls | grep _svg | xargs -I file mv  file svg__