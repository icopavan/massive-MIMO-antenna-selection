function ret = Cross3(pcross,lenchrom,chrom,sizepop,bound)
%本函数完成交叉操作
% pcorss                input  : 交叉概率
% lenchrom              input  : 染色体的长度
% chrom     			input  : 染色体群
% sizepop               input  : 种群规模
% ret                   output : 交叉后的染色体
%count 测试时的计数值
count =1;
 for i=1:sizepop  %每一轮for循环中，可能会进行一次交叉操作，染色体是随机选择的，交叉位置也是随机选择的，%但该轮for循环中是否进行交叉操作则由交叉概率决定（continue控制）
     % 随机选择两个染色体进行交叉
     pick=rand(1,2);
     while prod(pick)==0
         pick=rand(1,2);
     end
	 %sizepop = size(chrom,1);
     index=ceil(pick.*sizepop);%随机选取index
	 while index(1) == index(2)
	 pick = rand(1,2);index=ceil(pick.*sizepop);
	 end
     % 交叉概率决定是否进行交叉
     pick=rand;
     while pick==0
         pick=rand;
     end
     if pick>pcross
         continue;
     end
	 t = count-1
     % flag=0;
     % while flag==0
         % 随机选择交叉位
         pick=rand;
         while pick==0
             pick=rand;
         end
         pos=ceil(pick.*sum(lenchrom)); %随机选择进行交叉的位置，即选择第几个变量进行交叉，注意：两个染色体交叉的位置相同
		counts = 1;
		while chrom(index(1),pos) == chrom(index(2),pos) & counts < 10
			pick = rand;
			pos = ceil(pick.*sum(lenchrom));
			counts = counts +1;
		end
         v1=chrom(index(1),pos);
		 v2=chrom(index(2),pos);
		 chrom(index(1),pos) = v2;
		 chrom(index(2),pos) = v1;
		count = count+1;
		count
		% pick=rand; %交叉开始
         % v1=chrom(index(1),pos);
         % v2=chrom(index(2),pos);
         % chrom(index(1),pos)=pick*v2+(1-pick)*v1;
         % chrom(index(2),pos)=pick*v1+(1-pick)*v2; %交叉结束
     % end
	 % chrom(index(1),:) = sort01(chrom(index(1)));
	 % chrom(index(2),:) = sort01(chrom(index(2)));
 end
ret=chrom;
