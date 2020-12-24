%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% 湘潭大学考试试卷模板
% Haizhuan Yuan(袁海专）
% Version 1.0 (22/12/2020)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{xtuexampaper}[2020/12/20 LaTeX Templates Examination Paper Class v1.0]
\LoadClass[a4paper,UTF8]{ctexart} % Load the base class

%%========================================================
%%  宏包
%%========================================================
\usepackage{lastpage}
\usepackage{color}
\usepackage{ulem}
\usepackage{titlesec}
\usepackage{graphicx}
\usepackage{colortbl}
\usepackage{listings}
\usepackage{makecell}
\usepackage{indentfirst}
\usepackage{fancyhdr}
\usepackage{multirow}
\usepackage{setspace} % 行间距
\usepackage{bm}%\boldsymbol 粗体
\usepackage{pythonhighlight}
\usepackage{adjustbox}
\usepackage{amsmath,amsfonts,amsmath,amssymb,times}
\usepackage{txfonts}
\usepackage{enumerate}% 编号
\usepackage{fancyhdr}
\usepackage{fancybox}
\usepackage{tikz,pgfplots} %绘图
\usepackage{tkz-euclide,pgfplots}
\usepackage{ifthen}
\usepackage{multicol}
\usetikzlibrary{automata,positioning}
\usepackage[top=1.2cm,bottom=1.5cm,left=2.0cm,right=1cm]{geometry}
%\usepackage[paperwidth=18.4cm,paperheight=26cm,top=1.5cm,
%bottom=1.5cm,left=2.0cm,right=1cm]{geometry} % 单页


%%========================================================
%%  list 环境设置
%%========================================================
\lstset{
	%    numbers=left,
	%    numberstyle= \tiny,
	basicstyle=\ttfamily\small,%\setstretch{.5},
	keywordstyle= \color{ blue!70},
	commentstyle= \color{red!50!green!50!blue!50},
	frame=shadowbox, % 阴影效果
	rulesepcolor= \color{ red!20!green!20!blue!20} ,
	escapeinside=``, % 英文分号中可写入中文
	emph={and,break,class,continue,def,yield,del,elif ,else,%
		except,exec,finally,for,from,global,if,import,in,%
		lambda,not,or,pass,print,raise,return,try,while,assert,with}
} 
\setmainfont{Times New Roman}
\setsansfont{DejaVu Sans}
\setmonofont{Latin Modern Mono}


%%========================================================
%%  页面设置
%%========================================================
\renewcommand{\headrulewidth}{0pt}
\pagestyle{fancy}
\fancyhf{}
\fancyfoot[CO,CE]{
	\vspace*{0.5mm}第\,\thepage\,页 , 共 ~\pageref{LastPage} 页}
\renewcommand{\headrulewidth}{0pt} %页眉横线宽度===========
\setlength{\headsep}{5pt}
\setlength{\footskip}{10pt}
\fancypage{%
	\setlength{\fboxsep}{8pt}%
	\setlength{\fboxrule}{0.8pt}%
	\setlength{\shadowsize}{0pt}%
	\shadowbox}{}

%%========================================================
%%  装订线宏定义
%%========================================================
\newcommand{\@school}[1]{}
\newcommand{\school}[1]{\gdef\@school{#1}}	
%%---------------------------------------------
\newcommand{\@papermaker}[1]{}
\newcommand{\papermaker}[1]{\gdef\@papermaker{#1}}	
%%---------------------------------------------
\newcommand{\@copies}[1]{}
\newcommand{\copies}[1]{\gdef\@copies{#1}}	
%%---------------------------------------------
\newcommand{\@serialno}[1]{}
\newcommand{\serialno}[1]{\gdef\@serialno{#1}}	
%%---------------------------------------------
\newcommand{\@approvaldate}[1]{}
\newcommand{\approvaldate}[1]{\gdef\@approvaldate{#1}}	
%%---------------------------------------------
\newcommand{\@reviewer}[1]{}
\newcommand{\reviewer}[1]{\gdef\@reviewer{#1}}	
%%---------------------------------------------

\newcommand{\zdxbox}{
\newsavebox{\zdx}%装订线
\sbox{\zdx}
{\parbox{30cm}{\centering  ~~~
		制卷人（学院、姓名）: \underline{\makebox[60mm][c]{\@school、\@papermaker}}~ 
		审核人签名: \underline{\makebox[28mm][c]{\@reviewer}}~
		审核日期: \underline{\makebox[37mm][c]{\@approvaldate}} ~
		制卷份数: \underline{\makebox[13mm][c]{\@copies}}
		（编号：\underline{\makebox[16mm][c]{\@serialno}}）\\
		\vspace{1mm}
		\dotfill{} 装\dotfill{}订\dotfill{}线\dotfill{} \\
}}
\usebox{\zdx}
}

\newcommand{\putzdx}{
	\vspace{-0.5cm}
	\setlength{\marginparsep}{-0.1cm}
	%	\putzdx %%装订线--奇页数
	\marginpar{
		\parbox{3.5cm}{\vspace{-1.6cm}
			\rotatebox[origin=c]{90}{
				\zdxbox
		}}
}}

\reversemarginpar

%%========================================================
%%  试卷卷头
%%========================================================
\newcommand{\@schoolyear}[1]{}
\newcommand{\schoolyear}[1]{\gdef\@schoolyear{#1}}	
%%---------------------------------------------
\newcommand{\@schoolterm}[1]{}
\newcommand{\schoolterm}[1]{\gdef\@schoolterm{#1}}
%%---------------------------------------------	
\newcommand{\@studentgrade}[1]{}
\newcommand{\studentgrade}[1]{\gdef\@studentgrade{#1}}	
%%---------------------------------------------
\newcommand{\@course}[1]{}
\newcommand{\course}[1]{\gdef\@course{#1}}
%%---------------------------------------------	
\newcommand{\@controlno}[1]{}
\newcommand{\controlno}[1]{\gdef\@controlno{#1}}
%%---------------------------------------------	
\newcommand{\@major}[1]{}
\newcommand{\major}[1]{\gdef\@major{#1}}
%%---------------------------------------------	
\newcommand{\@exammethod}[1]{}
\newcommand{\exammethod}[1]{\gdef\@exammethod{#1}}
%%---------------------------------------------	
\newcommand{\@examtime}[1]{}
\newcommand{\examtime}[1]{\gdef\@examtime{#1}}
%%---------------------------------------------	
\newcommand{\@papermarker}[1]{}
\newcommand{\papermarker}[1]{\gdef\@papermarker{#1}}	
%%---------------------------------------------


\newcommand{\PaperHeader}{
\putzdx  % 装订线
\vspace{-1cm}
\begin{spacing}{1.25}
	\begin{center}
		\begin{huge}\bf
			湘潭大学 \underline{~ \@schoolyear ~} 年 \underline{~ \@schoolterm ~ } 学期 
			 \underline{ ~ {\@studentgrade} ~} 级\\
			\underline{~ \@course ~} 课程考试试卷\ （\@controlno ） \\
		\end{huge}
		\vspace{0.2cm}
		\begin{large}\bf
			适用专业 \underline{~ \@major ~ } \\
			\vspace{0.2cm}
			考试方式 \underline{ \makebox[14mm][c]{\@exammethod }} \qquad 考试时间 \underline{ \makebox[14mm][c]{\@examtime} } 分钟
		\end{large}
		\\ \vspace{0.25cm}
		\begin{large}
			学~院~\underline{\makebox[34mm][c]{}}~ 
			专~业~\underline{\makebox[34mm][c]{}}~
			班~级~\underline{\makebox[34mm][c]{}}~
			\\
			\vspace{0.25cm}
			学~号~\underline{\makebox[44mm][c]{}}~
			姓~名~\underline{\makebox[34mm][c]{}} 
		\end{large}	
	\end{center}
\end{spacing}
}

\renewcommand{\baselinestretch}{1.2}

%%========================================================
%%  记分栏
%%========================================================
\newcommand{\ScoringSheet}[1]{
\vspace{-0.1cm}
\begin{spacing}{1.25}
	\begin{center}	
	\ifthenelse{ #1 = 2}{
		\begin{tabular}{|m{0.04\textwidth}|*{#1}{m{0.1\textwidth}|}m{0.1\textwidth}|p{0.12\textwidth}|}\hline
			\centering  \makecell{题\\号} &
			\centering 一 & \centering 二 & 
			\centering \makecell{总~分} & \makecell{阅卷\\教师} \\
			\hline
			\centering \makecell{得\\分} & & & & \\\hline
		\end{tabular}
	}{}	
	\ifthenelse{ #1 = 3}{
		\begin{tabular}{|m{0.04\textwidth}|*{#1}{m{0.09\textwidth}|}m{0.1\textwidth}|p{0.11\textwidth}|}	\hline
			\centering  \makecell{题\\号} &
			\centering 一 & \centering 二 & \centering 三 & 
			\centering \makecell{总~分} & \makecell{阅卷\\教师} \\
			\hline
			\centering \makecell{得\\分} & & & & & \\\hline
		\end{tabular}
	}{}
	\ifthenelse{ #1 = 4}{
		\begin{tabular}{|m{0.04\textwidth}|*{#1}{m{0.08\textwidth}|}m{0.09\textwidth}|p{0.1\textwidth}|}	\hline
			\centering  \makecell{题\\号} &
			\centering 一 & \centering 二 & \centering 三 & \centering 四 &
			\centering \makecell{总~分} & \makecell{阅卷\\教师} \\
			\hline
			\centering \makecell{得\\分} & & & & & & \\\hline
		\end{tabular}
	}{}
	\ifthenelse{ #1 = 5}{
	\begin{tabular}{|m{0.04\textwidth}|*{#1}{m{0.07\textwidth}|}m{0.08\textwidth}|p{0.09\textwidth}|}	\hline
		\centering  \makecell{题\\号} &
		\centering 一 & \centering 二 & \centering 三 & \centering 四 & \centering 五 &
		\centering \makecell{总~分} & \makecell{阅卷\\教师} \\
		\hline
		\centering \makecell{得\\分} & & & & & & &\\\hline
	\end{tabular}
	}{}
	\ifthenelse{ #1 = 6}{
	\begin{tabular}{|m{0.04\textwidth}|*{#1}{m{0.07\textwidth}|}m{0.08\textwidth}|p{0.09\textwidth}|}	\hline
		\centering  \makecell{题\\号} &
		\centering 一 & \centering 二 & \centering 三 & \centering 四 & \centering 五 & \centering 六 &
		\centering \makecell{总~分} & \makecell{阅卷\\教师} \\
		\hline
		\centering \makecell{得\\分} & & & & & & & & \\\hline
	\end{tabular}
	}{}
	\ifthenelse{ #1 = 7}{
	\begin{tabular}{|m{0.04\textwidth}|*{#1}{m{0.06\textwidth}|}m{0.07\textwidth}|p{0.08\textwidth}|}	\hline
		\centering  \makecell{题\\号} &
		\centering 一 & \centering 二 & \centering 三 & \centering 四 & \centering 五 & \centering 六 & \centering 七 &
		\centering \makecell{总~分} & \makecell{阅卷\\教师} \\
		\hline
		\centering \makecell{得\\分} & & & & & & & & & \\\hline
	\end{tabular}
	}{}
	\ifthenelse{ #1 = 8}{
		\begin{tabular}{|m{0.04\textwidth}|*{#1}{m{0.06\textwidth}|}m{0.07\textwidth}|p{0.08\textwidth}|}	\hline
			\centering  \makecell{题\\号} &
			\centering 一 & \centering 二 & \centering 三 & \centering 四 & \centering 五 & \centering 六 & \centering 七 & \centering 八 &
			\centering \makecell{总~分} & \makecell{阅卷\\教师} \\
			\hline
			\centering \makecell{得\\分} & & & & & & & & & & \\\hline
		\end{tabular}
	}{}
	\ifthenelse{ #1 = 9}{
		\begin{tabular}{|m{0.04\textwidth}|*{#1}{m{0.05\textwidth}|}m{0.06\textwidth}|p{0.07\textwidth}|}	\hline
			\centering  \makecell{题\\号} &
			\centering 一 & \centering 二 & \centering 三 & \centering 四 & \centering 五 & \centering 六 & \centering 七 & \centering 八 & \centering 九 &
			\centering \makecell{总~分} & \makecell{阅卷\\教师} \\
			\hline
			\centering \makecell{得\\分} & & & & & & & & & & & \\\hline
		\end{tabular}
	}{}
	\ifthenelse{ #1 = 10}{
		\begin{tabular}{|m{0.04\textwidth}|*{#1}{m{0.05\textwidth}|}m{0.06\textwidth}|p{0.07\textwidth}|}	\hline
			\centering  \makecell{题\\号} &
			\centering 一 & \centering 二 & \centering 三 & \centering 四 & \centering 五 & \centering 六 & \centering 七 & \centering 八 & \centering 九 & \centering 十 &
			\centering \makecell{总~分} & \makecell{阅卷\\教师} \\
			\hline
			\centering \makecell{得\\分} & & & & & & & & & & & & \\\hline
		\end{tabular}
	}{}
	\end{center}
\end{spacing}
%\hspace{-0.8cm}\makebox[18cm]{\dotfill}
\noindent \dotfill{} 
%\vspace{0.1cm}
}


%%========================================================
%%  是否显示答案
%%========================================================
\newcounter{showanswer}
\newcommand{\showanswer}[1]{\gdef\@showanswer{#1}}	
\renewcommand{\show}[1]{ \ifthenelse{ \@showanswer = 0}{}{#1} }	

%%========================================================
%%  大题题目，含得分栏
%%========================================================
\newcommand{\chinesetitle}[2]{
	\ifthenelse{ #1 = 1}{一、#2}{\hspace{-0.35em}}
	\ifthenelse{ #1 = 2}{二、#2}{\hspace{-0.35em}}
	\ifthenelse{ #1 = 3}{三、#2}{\hspace{-0.35em}}
	\ifthenelse{ #1 = 4}{四、#2}{\hspace{-0.35em}}
	\ifthenelse{ #1 = 5}{五、#2}{\hspace{-0.35em}}
	\ifthenelse{ #1 = 6}{六、#2}{\hspace{-0.35em}}
	\ifthenelse{ #1 = 7}{七、#2}{\hspace{-0.35em}}
	\ifthenelse{ #1 = 8}{八、#2}{\hspace{-0.35em}}
	\ifthenelse{ #1 = 9}{九、#2}{\hspace{-0.35em}}
	\ifthenelse{ #1 = 10}{十、#2}{\hspace{-0.35em}}
}

\newcounter{secnumber}
\setcounter{secnumber}{0}
\newcounter{subsecnumber}
\setcounter{subsecnumber}{0}

\usepackage{wrapfig}

\newcommand{\newsection}[1]{
	\stepcounter{secnumber}
	\setcounter{subsecnumber}{0}
	\vspace{-0.2cm}
\noindent ~
	\begin{minipage}{\linewidth}
	\vspace{-0.2cm}
   \hspace{-0.12cm}
	\begin{wraptable}{l}{0.13\textwidth}
		\begin{tabular}{|p{0.05\textwidth}|p{0.05\textwidth}|}
		\hline
		\centering \makecell{得\\分} & \\
		\hline
		\end{tabular} 
	\end{wraptable}\\
	{  % 行间距设置
		\bf ~~ \\ \vspace{-0.45cm} ~~\\ 
		\vspace{0.1cm}
		\large ~ \chinesetitle{\arabic{secnumber}}{#1} 
	}
\end{minipage}
	%	\vspace{0.0cm} %\\
}

%%========================================================
%%  小题
%%========================================================
\newcommand{\answer}[2]{ 
	\begin{minipage}[t][#1][t]{0.98\textwidth}
		\show{{\bfseries 参考答案：} {#2}}
	\end{minipage}
}
%%========================================================
%%  小题
%%========================================================
\newcommand{\newsubsection}[1]{	
	\begin{enumerate}\setcounter{enumi}{\arabic{subsecnumber}}
		\item #1
	\end{enumerate}
	\stepcounter{subsecnumber}	
}

%%========================================================
%%  选择题
%%========================================================
\newcommand{\newchoice}[7]{	
%	\noindent
	\begin{enumerate}\setcounter{enumi}{\arabic{subsecnumber}}
		\item #1 \hfill  (\makebox[10mm][c]{\show{#2}}) ~  \\
		\ifthenelse{ #3 = 1}{
			\begin{tabular}
				{*{4}{@{}p{4.0cm}}}(A)~#4 & (B)~#5 & (C)~#6 & (D)~#7
			\end{tabular}			
		}{}
		\ifthenelse{ #3 = 2}{
			\begin{tabular}{*{2}{@{}p{8cm}}}(A)~#4 & (B)~#5
			\end{tabular}\\
			\begin{tabular}{*{2}{@{}p{8cm}}}(C)~#6 & (D)~#7
			\end{tabular}
		}{}
		\ifthenelse{ #3 = 4}{
			(A)~#4 \\ (B)~#5 \\ (C)~#5 \\ (D)~#7
		}{}
	\end{enumerate}
	\stepcounter{subsecnumber}	
}

%%========================================================
%%  判断题
%%========================================================
\usepackage{bbding} 
\newcommand{\newjudgment}[2]{	
	%	\noindent
	\begin{enumerate}\setcounter{enumi}{\arabic{subsecnumber}}
		\item #1 
		~~\dotfill{}~~%\hfill  
		(\makebox[10mm][c]{
			 \ifthenelse{ #2 = 0}{\show{\XSolidBrush}}{\show{\CheckmarkBold}}
		}) ~
	\end{enumerate}
	\stepcounter{subsecnumber}	
}


%%========================================================
%%  填空
%%========================================================
\renewcommand{\fill}[2]{ \underline{ \makebox[#1][c]{\show{#2}} } }


