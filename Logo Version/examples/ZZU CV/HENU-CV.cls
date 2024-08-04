%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Medium Length Professional CV
% LaTeX Class
% Version 3.0 (December 17, 2022)
%
% This template is published on github
% http://www.LaTeXTemplates.com
%
% Original header:
% Copyright (C) 2010 by Trey Hunner
%
% Copying and distribution of this file, with or without modification,
% are permitted in any medium without royalty provided the copyright
% notice and this notice are preserved. This file is offered as-is,
% without any warranty.
%
% Created by Trey Hunner and modified by www.LaTeXTemplates.com
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{HENU-CV}[2022/12/17 v3.0 Resume class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexart}} % Pass through any options to the base class
\ProcessOptions\relax
\LoadClass{ctexart}

% 加载常用宏包，并添加简要注释
\RequirePackage{amsmath}  % 数学公式
\RequirePackage{amssymb}  % 数学符号
\RequirePackage{enumitem} % 列表环境
\RequirePackage{tikz}     % 绘图
\RequirePackage{xcolor}    % 颜色
\RequirePackage{etoolbox} % 条件判断
\RequirePackage{fontspec} % 字体设置
\RequirePackage{fancybox} % 阴影框
\RequirePackage{float}    % 图表浮动
\RequirePackage[colorlinks]{hyperref} % 超链接
\RequirePackage{graphicx} % 图形
\RequirePackage{geometry} % 页面几何设置
\RequirePackage{titlesec} % 标题样式
\RequirePackage{fancyhdr} % 页眉页脚
\RequirePackage{fontawesome} % FontAwesome 图标
\RequirePackage{multicol} % 多栏
\RequirePackage{tabularx} % 表格
\RequirePackage{ifthen}   % 条件判断

% 标题格式
\titleformat{\section}
  {\LARGE\bfseries\raggedright}
  {}{0em}
  {}[{\color{customcolor}\titlerule}]
%\titlespacing*{\section}{0cm}{*1.2}{*1.}

\titleformat{\subsection}
  {\large\bfseries\raggedright}
  {}{0em}
  {}[]
%\titlespacing*{\subsection}{0cm}{*1.2}{*1.2}

% 页面大小与页边距
\geometry{
    a4paper,
	top=0.6in, % Top margin
	bottom=0.6in, % Bottom margin
	left=0.25in, % Left margin
	right=0.25in, % Right margin
	%showframe, % Uncomment to show how the type block is set on the page
}
\setlength\headwidth{0pt}
\renewcommand{\arraystretch}{1.2}
\linespread{1.2}
%\renewcommand{\CJKglue}{\hskip 0.05em} 设定中英文空格距离

% 自定义字体
\setmainfont[
    Path=fonts/,
    Extension=.ttf,
    BoldFont=* Bold,
]{SweiSpring}
\setCJKmainfont[
    Path=fonts/,
    Extension=.ttf,
    BoldFont=* Bold,
]{SweiSpring}


\RequirePackage{ifthen} % Required for ifthenelse statements
% 定义用于自定义经历的 cSubsection 环境
\newenvironment{rSubsection}[4]{ % 4个参数：公司名称，任职年限，职位和地点
\textbf{#1} \hfill {#2} % 加粗的公司名称和右侧的日期
\smallskip \par
\ifthenelse{\equal{#3}{}}{}{ % 如果第三个参数为空，则不输出职位和地点行
\textit{#3} \hfill \textit{#4} % 输出斜体的职位和地点
    }
    \begin{list}{$\cdot$}{\leftmargin=4em} % \cdot used for bullets, no indentation
		\setlength{\itemsep}{0em} % Reduce vertical spacing between items in the list for a tighter look
}{
	\end{list}
}

\newenvironment{cSubsection}[4]{ % 4个参数：公司名称，任职年限，职位和地点
\textbf{#1} \hfill {#2} % 加粗的公司名称和右侧的日期
\smallskip \par
\ifthenelse{\equal{#3}{}}{}{ % 如果第三个参数为空，则不输出职位和地点行 
\textit{#3} \hfill \textit{#4} % 输出斜体的职位和地点
    }
    \smallskip
}

\AtBeginDocument{
% 页眉和页脚设置
\fancypagestyle{plain}{
    \fancyhf{} % 清空当前页眉和页脚

    % 页眉
    \fancyhead[L]{
        \begin{tikzpicture}[remember picture, overlay]
            \node[anchor=north, inner sep=0pt](header) at (current page.north){
                \setlength{\fboxsep}{0pt}
                \colorbox{customcolor}{\makebox[\paperwidth][c]{\shortstack[c]{\vspace{0.75in}}}}
            };
            \node[anchor=west](school_logo) at (header.west){
                \hspace{0.5cm}
                \aLogo
            };
            \node[anchor=east](school_name) at(header.east){
                \textcolor{white}{\textbf{\school}}
                \hspace{0.5cm}
            };
        \end{tikzpicture}
    }

    % 页脚
    \fancyfoot[L]{
        \begin{tikzpicture}[remember picture, overlay]
            \node[anchor=south, inner sep=0pt](footer) at (current page.south){
                \setlength{\fboxsep}{0pt}
                \colorbox{customcolor}{\makebox[\paperwidth][c]{\shortstack[c]{\vspace{0.5in}}}}
            };
            % 页脚联系方式
            \node[anchor=center, yshift=0.25in] at (footer.south) {\contact};
        \end{tikzpicture}
    }
    
}

% 设置普通页面样式与背景水印
    % 背景校徽水印
    \begin{tikzpicture}[remember picture, overlay]
        \node[opacity=0.15] at (current page.center) {
            %\includegraphics[width=0.7\paperwidth, keepaspectratio]{images/zzu_logo_big.png}
            \bLogo
        };
    \end{tikzpicture}


    \pagestyle{plain}
}
