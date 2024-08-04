%% Start of file `logo-cv.cls'.
% Logo CV Class File
%
% This template has been downloaded from:
% https://github.com/IceySwan/Iys-CV
%
% Authors: Icey Swan <hi@icey.one>
% Copyright 2024 Icey One(https://www.icey.one/)
%
% Template license:
% CC BY-SA 4.0 (https://creativecommons.org/licenses/by-sa/4.0/)
%
% Notes:
% 1) This class file defines the structure and layout of the template file (cv.tex, resume.tex).
% 2) It has been written in such a way that under most circumstances you
% should not need to edit it.
%
% Class license:
% LPPL v1.3c (http://www.latex-project.org/lppl)
%
%% =============================================================================%%
\ProvidesClass{logo-cv}[2024/07/28]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexart}} % Pass through any options to the base class
\ProcessOptions\relax
\LoadClass{ctexart}

% 加载常用宏包，并添加简要注释
\RequirePackage{amsmath}  % 数学公式
\RequirePackage{amssymb}  % 数学符号
\RequirePackage{romannum} % 罗马数字
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

\titleformat{\subsection}
  {\large\bfseries\raggedright}
  {}{0em}
  {}[]

% 页面大小与页边距
\geometry{
	top=0.75in, % Top margin
	bottom=0.6in, % Bottom margin
	left=0.25in, % Left margin
	right=0.25in, % Right margin
	%showframe, % Uncomment to show how the type block is set on the page
}
\setlength\headwidth{0pt}
\renewcommand{\arraystretch}{1.2}
\linespread{1.2}

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
%\fancypagestyle{plain}{
%    \fancyhf{} % 清除默认的页眉和页脚
%    \renewcommand{\headrulewidth}{0.75in} % 页眉横线的高度
%    \renewcommand{\footrulewidth}{0.75in} % 页脚横线的高度
%}

% 设置默认的页眉和页脚样式
\pagestyle{plain}
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
            \bLogo
        };
    \end{tikzpicture}
    \pagestyle{plain}

    
}
