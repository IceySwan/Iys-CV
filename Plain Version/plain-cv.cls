%% Start of file `plain-cv.cls'.
% Plain CV Class File
%
% This template has been downloaded from:
% https://github.com/IceySwan/Iys-CV
%
% Authors:
% Icey Swan <hi@icey.one>
% 
% https://www.icey.one
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

%----------------------------------------------------------------------------------------
% CLASS CONFIGURATION
%----------------------------------------------------------------------------------------

\ProvidesClass{plain-cv}[2022/12/17 v3.1 Resume class]
\NeedsTeXFormat{LaTeX2e}

% Pass any options to the base class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexart}}
\ProcessOptions\relax % Process given options

% Load the base class
\LoadClass{ctexart}

%----------------------------------------------------------------------------------------
% REQUIRED PACKAGES AND MISC CONFIGURATIONS
%----------------------------------------------------------------------------------------

% Remove paragraph indentation
\RequirePackage[parfill]{parskip}

% Required for bold tabular columns
\RequirePackage{array}

% Required for ifthenelse statements
\RequirePackage{ifthen}

% Required for including images
\RequirePackage{graphicx}

% Setup hyperlinks with blue color
\RequirePackage[colorlinks]{hyperref}

% Suppress headers and footers on all pages
\pagestyle{empty}

% Use Times font
%\RequirePackage{times}

% Tabularx package for better table control
\RequirePackage{tabularx}

% Improved tables
\RequirePackage{booktabs}

% Roman numbera
\RequirePackage{romannum} 

%----------------------------------------------------------------------------------------
%	SECTION FORMATTING
%----------------------------------------------------------------------------------------

\RequirePackage{titlesec}
\titleformat{\section}
  {\LARGE\bfseries\raggedright}
  {}{0em}
  {}[{\titlerule}]

\titleformat{\subsection}
  {\large\bfseries\raggedright}
  {}{0em}
  {}[]

%----------------------------------------------------------------------------------------
% MARGINS
%----------------------------------------------------------------------------------------

% Required for adjusting page dimensions and margins
\RequirePackage{geometry}
\geometry{left=2.0cm, top=1.5cm, right=2.0cm, bottom=2.0cm, footskip=.5cm}
%\setlength\headwidth{0pt}
\renewcommand{\arraystretch}{1.2}
\linespread{1.2}
%----------------------------------------------------------------------------------------
%	NAME AND ADDRESS COMMANDS
%----------------------------------------------------------------------------------------

\newcommand{\setname}[1]{\def\name{#1}} % Defines the \setname command to set the user's name

\newcommand{\addressSep}{$\diamond$} % Set default address separator to a diamond symbol

% One, two or three address lines can be specified
\let \@addressone \relax
\let \@addresstwo \relax
\let \@addressthree \relax

% The \address command is used to set the first, second and third address lines (the last 2 are optional)
\newcommand{\address}[1]{
	\@ifundefined{@addressone}{ % If the first address line has not been set yet, set it
		\def \@addressone {#1}
	}{
		\@ifundefined{@addresstwo}{ % If the second address line has not been set yet, set it
			\def \@addresstwo {#1}
		}{ % Otherwise, set the third address line
			\def \@addressthree {#1}
		}%
	}
}

% \printaddress is used to style an address line (provided in the single parameter to the command)
\newcommand{\printaddress}[1]{
	\begingroup
		\def \\ {\addressSep\ } % Redefine newlines (\\) to the address separator symbol so multiple lines of each address are output as a single line
		\centerline{#1} % Output the centered address line
	\endgroup
	\par % End the paragraph to ensure correct spacing between lines
}

% \printname is used to output the user's name in a large size

\newcommand{\printname}{
	\begingroup
		\hfil{
      %\MakeUppercase
      {\huge\bfseries\name}
      }\hfil % Style and output the user's name
		\smallskip
    \break % Vertical whitespace below name
	\endgroup
}

%----------------------------------------------------------------------------------------
%	OUTPUT THE NAME & ADDRESS LINES AUTOMATICALLY
%----------------------------------------------------------------------------------------

\let\ori@document=\document % Store the original \document command
\renewcommand{\document}{
	\ori@document  % Output the original \document command but add to it below
	\printname % Output the user's name
	\@ifundefined{@addressone}{}{\printaddress{\@addressone}} % Output the first address if specified
	\@ifundefined{@addresstwo}{}{\printaddress{\@addresstwo}} % Output the second address if specified
	\@ifundefined{@addressthree}{}{\printaddress{\@addressthree}} % Output the third address if specified
}

%----------------------------------------------------------------------------------------
%	WORK EXPERIENCE FORMATTING
%----------------------------------------------------------------------------------------

% Environment for work experience subsections
% 4 parameters: company name, year(s) employed, job title, and location
\newenvironment{rSubsection}[4]{
  \textbf{#1} \hfill {#2} % Bold company name and date to the right
  \smallskip \\
  \ifthenelse{\equal{#3}{}}{}{ % If the third parameter is not empty
     % Job title and location on a new line
    \textit{#3} \hfill \textit{#4} % Italic job title and location
  }
  \smallskip % Vertical whitespace
  \begin{list}{$\cdot$}{\leftmargin=2em} % Bullet points, no indentation
    \setlength{\itemsep}{-0.5em} \vspace{-0.5em} % Tighter spacing
}{
  \end{list}
  \vspace{0.5em} % Vertical whitespace after the list
}
% Simplified subsection environment for work experience
\newenvironment{cSubsection}[4]{
  \textbf{#1} \hfill {#2} % Bold company name and date to the right
  \smallskip \\
  \ifthenelse{\equal{#3}{}}{}{ % If the third parameter is not empty
    \textit{#3} \hfill \textit{#4} % Italic job title and location
    }
    \smallskip
}

