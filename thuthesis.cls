%%
%% This is file `thuthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% thuthesis.dtx  (with options: `cls')
%% 
%% This is a generated file.
%% 
%% Copyright (C) 2005-2018 by Ruini Xue <xueruini@gmail.com>
%% 
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%% 
%% To produce the documentation run the original source files ending with `.dtx'
%% through LaTeX.
%% 
%% ---------------------------额外加的一些包---------------------------------
% 处理字符串(e.g. \StrRight)
\usepackage{xstring} 
% -------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{thuthesis}
[2018/9/3 5.4.3 CUG Thesis Template]
\hyphenation{Thu-Thesis}
\def\thuthesis{\textsc{ThuThesis}}
\def\version{5.4.3}

\RequirePackage{kvoptions}
\SetupKeyvalOptions{
  family=thu,
  prefix=thu@,
  setkeys=\kvsetkeys}
\newif\ifthu@bachelor
\newif\ifthu@master
\newif\ifthu@doctor
\newif\ifthu@postdoctor
\define@key{thu}{degree}{%
  \thu@bachelorfalse
  \thu@masterfalse
  \thu@doctorfalse
  \thu@postdoctorfalse
  \expandafter\csname thu@#1true\endcsname}
\define@key{thu}{type}{%
  \ClassError{thuthesis}{'type' is deprecated, \MessageBreak
                         please use 'degree=#1' instead}{}}
\def\thu@deprecated@degree@option{%
  \ClassError{thuthesis}{Option '\CurrentOption' is deprecated, \MessageBreak
                         please use 'degree=\CurrentOption' instead}{}}
\DeclareVoidOption{bachelor}{\thu@deprecated@degree@option}
\DeclareVoidOption{master}{\thu@deprecated@degree@option}
\DeclareVoidOption{doctor}{\thu@deprecated@degree@option}
\DeclareVoidOption{postdoctor}{\thu@deprecated@degree@option}
\DeclareBoolOption{secret}
\DeclareBoolOption{arialtoc}
\DeclareBoolOption{arialtitle}
\IfFileExists{/dev/null}{}{\PassOptionsToClass{fontset=windowsold}{ctexbook}}
\DeclareBoolOption{raggedbottom}
\DeclareBoolOption{pifootnote}
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\kvsetkeys{thu}{%
  raggedbottom,
  arialtitle}
\ProcessKeyvalOptions*
\ifthu@bachelor\relax\else
  \ifthu@master\relax\else
    \ifthu@doctor\relax\else
      \ifthu@postdoctor\relax\else
        \ClassError{thuthesis}%
                   {Please specify thesis degree in option: \MessageBreak
                    degree=[bachelor | master | doctor | postdoctor]}{}
      \fi
    \fi
  \fi
\fi
\PassOptionsToPackage{no-math}{fontspec}
\LoadClass[a4paper,openany,UTF8,zihao=-4,scheme=plain]{ctexbook}
\RequirePackage{etoolbox}
\RequirePackage{ifxetex}
\RequirePackage{xparse}
\RequirePackage{amsmath}
\RequirePackage[defaultsups]{newtxtext}
\RequirePackage{newtxmath}
\RequirePackage{courier}
\RequirePackage{graphicx}
\RequirePackage[labelformat=simple]{subcaption}
\RequirePackage{pdfpages}
\includepdfset{fitpaper=true}
\RequirePackage[shortlabels]{enumitem}
\RequirePackage{environ}
\ifthu@raggedbottom
  \RequirePackage[bottom,perpage,hang]{footmisc}
  \raggedbottom
\else
  \RequirePackage[perpage,hang]{footmisc}
\fi
\ifthu@pifootnote
  \RequirePackage{pifont}
\fi
\RequirePackage{CJKfntef}
\RequirePackage[amsmath,thmmarks,hyperref]{ntheorem}
\RequirePackage{array}
\RequirePackage{longtable}
\RequirePackage{booktabs}
\RequirePackage[sort&compress]{natbib}
\RequirePackage{hyperref}
\ifxetex
  \hypersetup{%
    CJKbookmarks=true}
\else
  \hypersetup{%
    unicode=true,
    CJKbookmarks=false}
\fi
% 设置交叉引用超链接
\hypersetup{%
  linktoc=all,
  bookmarksnumbered=true,
  bookmarksopen=true,
  bookmarksopenlevel=1,
  breaklinks=true,
  colorlinks=true,
  linkcolor=green!55!blue,
  anchorcolor=red,
  citecolor=blue!55!black,
  plainpages=false,
  pdfborder=0 0 0}
\urlstyle{same}
\RequirePackage{geometry}
\geometry{
  a4paper, % 210 * 297mm
  hcentering,
  ignoreall,
  nomarginpar}
\ifthu@bachelor
  \geometry{
    left=32mm,
    headheight=5mm,
    headsep=5mm,
    textheight=227mm,
    bottom=32mm,
    footskip=12mm}
\else
  \geometry{
    left=30mm,
    headheight=5mm,
    headsep=5mm,
    textheight=237mm,
    bottom=29mm,
    footskip=6mm}
\fi
\RequirePackage{fancyhdr}
\let\thu@cleardoublepage\cleardoublepage
\newcommand{\thu@clearemptydoublepage}{%
  \clearpage{\pagestyle{thu@empty}\thu@cleardoublepage}}
\let\cleardoublepage\thu@clearemptydoublepage
\renewcommand\frontmatter{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmatterfalse
  \pagenumbering{Roman}
  \pagestyle{thu@empty}}
\renewcommand\mainmatter{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmattertrue
  \pagenumbering{arabic}
  \ifthu@bachelor\pagestyle{thu@plain}\else\pagestyle{thu@headings}\fi}
\renewcommand\backmatter{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmattertrue}
\renewcommand\normalsize{%
  \@setfontsize\normalsize{12bp}{20bp}%
  % 公式前后与正文的距离
  \abovedisplayskip=10bp \@plus 2bp \@minus 2bp
  \abovedisplayshortskip=10bp \@plus 2bp \@minus 2bp
  \belowdisplayskip=\abovedisplayskip
  \belowdisplayshortskip=\abovedisplayshortskip}
\def\thu@def@fontsize#1#2{%
  \expandafter\newcommand\csname #1\endcsname[1][1.3]{%
    \fontsize{#2}{##1\dimexpr #2}\selectfont}}
\thu@def@fontsize{chuhao}{42bp}
\thu@def@fontsize{xiaochu}{36bp}
\thu@def@fontsize{yihao}{26bp}
\thu@def@fontsize{xiaoyi}{24bp}
\thu@def@fontsize{erhao}{22bp}
\thu@def@fontsize{xiaoer}{18bp}
\thu@def@fontsize{sanhao}{16bp}
\thu@def@fontsize{xiaosan}{15bp}
\thu@def@fontsize{sihao}{14bp}
\thu@def@fontsize{banxiaosi}{13bp}
\thu@def@fontsize{xiaosi}{12bp}
\thu@def@fontsize{dawu}{11bp}
\thu@def@fontsize{wuhao}{10.5bp}
\thu@def@fontsize{xiaowu}{9bp}
\thu@def@fontsize{liuhao}{7.5bp}
\thu@def@fontsize{xiaoliu}{6.5bp}
\thu@def@fontsize{qihao}{5.5bp}
\thu@def@fontsize{bahao}{5bp}
\fancypagestyle{thu@empty}{%
  \fancyhf{}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}}
\fancypagestyle{thu@plain}{%
  \fancyhead{}
  \fancyfoot[C]{\xiaowu\thepage}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}}
\fancypagestyle{thu@headings}{%
  % 页眉设置
  \fancyhead{}
  \fancyhead[CO]{\thu@cuniversity\StrRight{\thu@cdegree}{2}学位论文}
  \fancyhead[CE]{\thu@cauthor\thu@title@sep\thu@ctitle}
  \fancyhead[RO]{\wuhao\thepage}
  \fancyhead[LE]{\wuhao\thepage}
  % \fancyhead[C]{\wuhao\normalfont\leftmark}
  \fancyfoot{}
  \fancyfoot{}
  \renewcommand{\headrulewidth}{0.4pt}
  \renewcommand{\footrulewidth}{0pt}}
\ctexset{%
  punct=quanjiao,
  space=auto,
  autoindent=true}
\setlist{nosep}
\def\thu@textcircled#1{%
  \ifnum\value{#1} >9
    \ClassError{thuthesis}%
      {Too many footnotes in this page.}{Keep footnote less than 10.}
  \fi
  \ifthu@pifootnote%
    \ding{\the\numexpr\value{#1}+171\relax}%
  \else%
    \textcircled{\xiaoliu\arabic{#1}}%
  \fi}
\renewcommand{\thefootnote}{\thu@textcircled{footnote}}
\renewcommand{\thempfootnote}{\thu@textcircled{mpfootnote}}
\def\footnoterule{\vskip-3\p@\hrule\@width0.3\textwidth\@height0.4\p@\vskip2.6\p@}
\let\thu@footnotesize\footnotesize
\renewcommand\footnotesize{\thu@footnotesize\xiaowu[1.5]}
\footnotemargin1.5em\relax
\let\thu@makefnmark\@makefnmark
\def\thu@@makefnmark{\hbox{{\normalfont\@thefnmark}}}
\pretocmd{\@makefntext}{\let\@makefnmark\thu@@makefnmark}{}{}
\apptocmd{\@makefntext}{\let\@makefnmark\thu@makefnmark}{}{}
\allowdisplaybreaks[4]
\renewcommand\theequation{\ifnum \c@chapter>\z@ \thechapter-\fi\@arabic\c@equation}
\def\make@df@tag{\@ifstar\thu@make@df@tag@@\make@df@tag@@@}
\def\thu@make@df@tag@@#1{\gdef\df@tag{\thu@maketag{#1}\def\@currentlabel{#1}}}
\iffalse
\ifthu@bachelor
  \def\thu@maketag#1{\maketag@@@{%
    (\ignorespaces\text{\equationname\hskip0.5em}#1\unskip\@@italiccorr)}}
  \def\tagform@#1{\maketag@@@{%
    (\ignorespaces\text{\equationname\hskip0.5em}#1\unskip\@@italiccorr)\equcaption{#1}}}
\fi
\fi
\def\thu@maketag#1{\maketag@@@{(\ignorespaces #1\unskip\@@italiccorr)}}
\def\tagform@#1{\maketag@@@{(\ignorespaces #1\unskip\@@italiccorr)\equcaption{#1}}}
\renewcommand{\eqref}[1]{\textup{(\ref{#1})}}
\setlength{\floatsep}{20bp \@plus4pt \@minus1pt}
\setlength{\intextsep}{20bp \@plus4pt \@minus2pt}
\setlength{\textfloatsep}{20bp \@plus4pt \@minus2pt}
\setlength{\@fptop}{0bp \@plus1.0fil}
\setlength{\@fpsep}{12bp \@plus2.0fil}
\setlength{\@fpbot}{0bp \@plus1.0fil}
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}
\ifthu@bachelor
  \g@addto@macro\appendix{\renewcommand*{\thefigure}{\thechapter-\arabic{figure}}}
  \g@addto@macro\appendix{\renewcommand*{\thetable}{\thechapter-\arabic{table}}}
\fi
\let\old@tabular\@tabular
\def\thu@tabular{\dawu[1.5]\old@tabular}
% 图表标题字体设置为五号
\DeclareCaptionLabelFormat{thu}{{\wuhao[1.5]\normalfont #1~#2}}
\DeclareCaptionLabelSeparator{thu}{\hspace{1em}}
\DeclareCaptionFont{thu}{\wuhao[1.5]}
\captionsetup{labelformat=thu,labelsep=thu,font=thu}
% 表格标题字体设置
\captionsetup[table]{position=top,belowskip={12bp-\intextsep},aboveskip=6bp}
\captionsetup[figure]{position=bottom,belowskip={16bp-\intextsep},aboveskip=6bp}
\captionsetup[sub]{font=thu,skip=6bp}
% 定义图注字体为小五号
\DeclareCaptionFont{thu_fnote}{\xiaowu[1.5]}
% 图标题下方的图注
\newcommand\fnote[1]{\captionsetup{font=thu_fnote}\caption*{#1}}
\renewcommand{\thesubfigure}{(\alph{subfigure})}
\renewcommand{\thesubtable}{(\alph{subtable})}
\let\thu@LT@array\LT@array
\def\LT@array{\dawu[1.5]\thu@LT@array} % set default font size
\def\hlinewd#1{%
  \noalign{\ifnum0=`}\fi\hrule \@height #1 \futurelet
    \reserved@a\@xhline}
\def\thu@title@font{%
  \ifthu@arialtitle\sffamily\else\heiti\fi}
\AtBeginDocument{%
  \pagestyle{thu@empty}
  \renewcommand{\chaptermark}[1]{\@mkboth{\CTEXthechapter\hskip\ccwd#1}{}}}
\newcommand\thu@chapter@titleformat[1]{%
  \ifthu@bachelor #1\else%
    \ifthenelse%
      {\equal{#1}{\eabstractname}}%
      {\bfseries #1}%
      {#1}%
  \fi}
  % 章标题设置
\ctexset{%
  chapter={
    afterindent=true, 
    pagestyle={\ifthu@bachelor thu@plain\else thu@headings\fi},
    beforeskip={\ifthu@bachelor 15bp\else 9bp\fi},
    aftername=\hskip\ccwd,
    afterskip={\ifthu@bachelor 20bp\else 24bp\fi},
    % 章标题字体设置
    format={\centering\thu@title@font\ifthu@bachelor\xiaosan[1.333]\else\sanhao[1]\bfseries\fi},
    nameformat=\relax,
     numberformat=\zhnumber,
    titleformat=\thu@chapter@titleformat,
    lofskip=0pt,
    lotskip=0pt,
  },
  % 一级节标题设置
  section={
    afterindent=true,
    beforeskip={\ifthu@bachelor 25bp\else 24bp\fi\@plus 1ex \@minus .2ex},
    afterskip={\ifthu@bachelor 12bp\else 6bp\fi \@plus .2ex},
    % 一级节标题字体设置
    format={\normalfont\ifthu@bachelor\sihao[1.286]\else\sihao[1.429]\bfseries\centering\fi},
  },
  subsection={
    afterindent=true,
    beforeskip={\ifthu@bachelor 12bp\else 16bp\fi\@plus 1ex \@minus .2ex},
    afterskip={6bp \@plus .2ex},
    % 二级节标题字体设置
    format={\heiti\ifthu@bachelor\xiaosi[1.25]\else\xiaosi[1.538]\fi},
    numberformat={\heiti\ifthu@bachelor\banxiaosi[1.154]\else\xiaosi[1.538]\fi},
  },
  subsubsection={
    afterindent=true,
    beforeskip={\ifthu@bachelor 12bp\else 16bp\fi\@plus 1ex \@minus .2ex},
    afterskip={6bp \@plus .2ex},
    format={\kaishu\ifthu@bachelor\xiaosi[1.25]\else\xiaosi[1.667]\fi},
  },
  paragraph/afterindent=true,
  subparagraph/afterindent=true}
\newcounter{thu@bookmark}
\NewDocumentCommand\thu@chapter{s o m o}{
  \IfBooleanF{#1}{%
    \ClassError{thuthesis}{You have to use the star form: \string\thu@chapter*}{}
  }%
  \if@openright\cleardoublepage\else\clearpage\fi\phantomsection%
  \IfValueTF{#2}{%
    \ifthenelse{\equal{#2}{}}{%
      \addtocounter{thu@bookmark}\@ne
      \pdfbookmark[0]{#3}{thuchapter.\thethu@bookmark}
    }{%
      \addcontentsline{toc}{chapter}{#3}
    }
  }{%
    \addcontentsline{toc}{chapter}{#3}
  }%
  \ifthu@bachelor \ctexset{chapter/beforeskip=25bp} \fi
  \chapter*{#3}%
  \ifthu@bachelor \ctexset{chapter/beforeskip=15bp} \fi
  \IfValueTF{#4}{%
    \ifthenelse{\equal{#4}{}}
    {\@mkboth{}{}}
    {\@mkboth{#4}{#4}}
  }{%
    \@mkboth{#3}{#3}
  }
}
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{2}
\renewcommand\tableofcontents{%
  \thu@chapter*[]{\contentsname}
  \ifthu@bachelor\xiaosi[1.667]\else\xiaosi[1.65]\fi\@starttoc{toc}\normalsize}
\ifthu@arialtoc
  \def\thu@toc@font{\sffamily}
\fi
\def\@pnumwidth{2em}
\def\@tocrmarg{\@pnumwidth}
\def\@dotsep{1}
\patchcmd{\@dottedtocline}{#4}{\csname thu@toc@font\endcsname #4}{}{}
\patchcmd{\@dottedtocline}{\hb@xt@\@pnumwidth}{\hbox}{}{}
\renewcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \ifthu@bachelor \vskip 6bp \else \vskip 4bp \fi \@plus\p@
    \setlength\@tempdima{4em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      % numberline is called here, and it uses \@tempdima
      {\ifthu@bachelor\sffamily\else\csname thu@toc@font\endcsname\fi\heiti #1}
      \leaders\hbox{$\m@th\mkern \@dotsep mu\hbox{.}\mkern \@dotsep mu$}\hfill
      \nobreak{\normalfont\normalcolor #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}
\renewcommand*\l@section{%
  \@dottedtocline{1}{\ccwd}{2.1em}}
\renewcommand*\l@subsection{%
  \@dottedtocline{2}{\ifthu@bachelor 1.5\ccwd\else 2\ccwd\fi}{3em}}
\renewcommand*\l@subsubsection{%
  \@dottedtocline{3}{\ifthu@bachelor 2.4em\else 3.5em\fi}{3.8em}}
\def\thu@def@term#1{%
  \define@key{thu}{#1}{\csname #1\endcsname{##1}}
  \expandafter\gdef\csname #1\endcsname##1{%
    \expandafter\gdef\csname thu@#1\endcsname{##1}}
  \csname #1\endcsname{}}
\thu@def@term{secretlevel}
\thu@def@term{secretyear}
\thu@def@term{ctitle}
\thu@def@term{etitle}
\thu@def@term{cauthor}
\thu@def@term{studentnum}
\thu@def@term{csupervisor}
\thu@def@term{cassosupervisor}
\thu@def@term{ccosupervisor}
\thu@def@term{eauthor}
\thu@def@term{esupervisor}
\thu@def@term{eassosupervisor}
\thu@def@term{ecosupervisor}
\thu@def@term{cdegree}
\thu@def@term{edegree}
\thu@def@term{cuniversity}
\thu@def@term{euniversity}
\thu@def@term{cdepartment}
\thu@def@term{eaddress}
\thu@def@term{cproject}
\def\caffil{% for compatibility
  \ClassWarning{thuthesis}
    {'\string\caffil' is deprecated, please use '\string\cdepartment' instead.}{}%
  \cdepartment}
\thu@def@term{edepartment}
\def\eaffil{% for compability
  \ClassWarning{thuthesis}
    {'\string\eaffil' is deprecated, please use '\string\edepartment' instead.}{}%
  \edepartment}
\thu@def@term{cmajor}
\def\csubject{% for compatibility
  \ClassWarning{thuthesis}
    {'\string\csubject' is deprecated, please use '\string\cmajor' instead.}{}%
  \cmajor}
\thu@def@term{emajor}
\def\esubject{%for compability
  \ClassWarning{thuthesis}
    {'\string\esubject' is deprecated, please use '\string\emajor' instead.}{}%
  \emajor}
\thu@def@term{cdate}
\thu@def@term{edate}
\thu@def@term{id}
\thu@def@term{udc}
\thu@def@term{catalognumber}
\thu@def@term{cfirstdiscipline}
\thu@def@term{cseconddiscipline}
\thu@def@term{postdoctordate}
\newcommand{\thu@@cabstract}[1]{\long\gdef\thu@cabstract{#1}}
\newenvironment{cabstract}{\Collect@Body\thu@@cabstract}{}
\newcommand{\thu@@eabstract}[1]{\long\gdef\thu@eabstract{#1}}
\newenvironment{eabstract}{\Collect@Body\thu@@eabstract}{}
\def\thu@parse@keywords#1{
  \define@key{thu}{#1}{\csname #1\endcsname{##1}}
  \expandafter\gdef\csname thu@#1\endcsname{}
  \expandafter\gdef\csname #1\endcsname##1{
    \@for\reserved@a:=##1\do{
      \expandafter\ifx\csname thu@#1\endcsname\@empty\else
        \expandafter\g@addto@macro\csname thu@#1\endcsname{%
          \ignorespaces\csname thu@#1@separator\endcsname}
      \fi
      \expandafter\expandafter\expandafter\g@addto@macro%
        \expandafter\csname thu@#1\expandafter\endcsname\expandafter{\reserved@a}}}}
\thu@parse@keywords{ckeywords}
\thu@parse@keywords{ekeywords}
\def\thusetup{\kvsetkeys{thu}}
\newcommand\thu@underline[2][6em]{\hskip1pt\underline{\hb@xt@ #1{\hss#2\hss}}\hskip3pt}
\newlength{\thu@title@width}
\ifxetex % todo: ugly codes
  \newcommand{\thu@put@title}[2][\thu@title@width]{%
  \begin{CJKfilltwosides}[b]{#1}#2\end{CJKfilltwosides}}
\else
  \newcommand{\thu@put@title}[2][\thu@title@width]{%
  \begin{CJKfilltwosides}{#1}#2\end{CJKfilltwosides}}
\fi
\def\thu@first@titlepage{%
  \ifthu@postdoctor\thu@first@titlepage@postdoctor\else\thu@first@titlepage@other\fi}
\newcommand{\thu@first@titlepage@postdoctor}{
  \begin{center}
    \setlength{\thu@title@width}{3em}
    \vspace*{0.7cm}
    \begingroup\wuhao[1.5]%
    \thu@put@title{\thu@catalog@number@title}\thu@underline\thu@catalognumber\hfill%
    \thu@put@title{\thu@secretlevel}%
      \expandafter\thu@underline\ifthu@secret\thu@secret@content\else\relax\fi\par
    \thu@put@title{U D C}\thu@underline\thu@udc\hfill%
    \thu@put@title{\thu@id@title}\thu@underline\thu@id\par\vskip3cm\endgroup
    \begingroup\heiti
      {\xiaochu\ziju{1}\thu@cuniversity}\par\vskip2cm
      {\xiaoyi\ziju{1}\thu@postdoctor@report@title}\par\vskip3cm
      {\sanhao[1.5]\thu@ctitle}\par\vskip2cm
      {\xiaoer\thu@cauthor}
    \endgroup
    \par\vskip3cm
    {\xiaosan[1.5]\ziju{1}\thu@cuniversity\par\vskip0.5em\CJK@todaysmall@short}
  \end{center}
  \cleardoublepage
  \begin{center}
    \vspace*{2cm}
    {\sihao\heiti\thu@ctitle\par\thu@etitle}\par
    \parbox[t][7cm][b]{\textwidth-6cm}{\sihao[1.5]%
      \setlength{\thu@title@width}{11em}
      \setlength{\extrarowheight}{6pt}
      \ifxetex % todo: ugly codes
        \begin{tabular}{p{\thu@title@width}@{}l@{\extracolsep{8pt}}l}
      \else
        \begin{tabular}{p{\thu@title@width}l@{}l}
      \fi
          \thu@put@title{\thu@author@title}
            & \thu@title@sep
            & \thu@cauthor \\
          \thu@put@title{\thu@postdoctor@first@discipline@title}
            & \thu@title@sep
            & \thu@cfirstdiscipline\\
          \thu@put@title{\thu@postdoctor@second@discipline@title}
            & \thu@title@sep
            & \thu@cseconddiscipline\\
          \thu@put@title{\thu@supervisor@title}
            & \thu@title@sep
            & \thu@csupervisor\\
        \end{tabular}}
    \vskip2cm
    {\sihao\thu@postdoctor@date@title\hskip1em\underline\thu@postdoctordate}
  \end{center}}
\newcommand{\thu@first@titlepage@other}{
  \begin{center}
    % \vspace*{-2cm}
    % \parbox[b][2.4cm][t]{\textwidth}{%
    %   \ifthu@secret{\heiti\sanhao\thu@secretlevel\thu@secret@content}\else\rule{1cm}{0cm}\fi}
    \ifthu@bachelor
      \vskip0.65cm
      {\yihao\lishu\ziju{0.5}\thu@cuniversity}
      \par\vskip1.5cm
      {\xiaochu\heiti\ziju{0.5}\textbf\thu@bachelor@subtitle}
      \vskip2.2cm\hskip0.8cm
      \noindent\heiti\xiaoer\thu@bachelor@title@pre\thu@title@sep
      \parbox[t]{12cm}{%
      \ignorespaces\yihao[1.51]%
      \renewcommand{\CJKunderlinebasesep}{0.25cm}%
      \renewcommand{\ULthickness}{1.3pt}%
      \ifxetex
        \xeCJKsetup{underline/format=\color{black}}%
      \else
        \def\CJKunderlinecolor{\color{black}}%
      \fi
      \CJKunderline*{\thu@ctitle}}%
      \vskip1.3cm
    \else
      % 学校代码 研究生学号
      \vspace*{-2cm}
      \parbox[t][4cm][t]{\textwidth}
        {
          {\sanhao[1.5]
          \begin{center}\fangsong
            % \setlength{\paperwidth}{5em}
            % \setlength{\textwidth}{4pt}
            \ifxetex % todo: ugly codes
              \begin{tabular*}{\hsize}{@{}@{\extracolsep{\fill}}lr@{}}
            \else
              \begin{tabular}{\textwidth}{ll}
            \fi
            % \hline
                学校代码  \thu@title@sep  10491 & 研究生学号 \thu@title@sep  \thu@studentnum\\
                % \hline
              \end{tabular*}
          \end{center}
          }
        }
      % 校名+学位论文
      \parbox[t][4cm][t]{\paperwidth-8cm}
        {
          \renewcommand{\baselinestretch}{1.3}
          \begin{center} %首页学校+学位论文
            \yihao[1.2]{\heiti\thu@cuniversity \\ \StrRight{\thu@cdegree}{2} 学位论文}\par%
            \par\vskip 18bp%
            \xiaoer[1]\textrm{\thu@apply}%
          \end{center}
        }
      \vskip0.8cm
      % 中文标题
      \parbox[t][5cm][t]{\paperwidth-8cm}
        {
          \renewcommand{\baselinestretch}{1.3}
          \begin{center} %中文标题
            \yihao[1.2]{\heiti\thu@ctitle}\par%
            \par\vskip 18bp%
            \xiaoer[1]\textrm{\thu@apply}%
          \end{center}
        }
    \fi
    \ifthu@bachelor
      \vskip0.75cm
      \ifx\thu@cassosupervisor\@empty%
        \def\thu@tempa{7.15cm}
      \else%
        \def\thu@tempa{8.15cm}
      \fi%
      \parbox[t][\thu@tempa][t]{\textwidth}{%
        {\fangsong\sanhao[1.95]%
         \hspace*{1.9cm}
         \setlength{\thu@title@width}{4em}
         \setlength{\extrarowheight}{6pt}
         \ifxetex % todo: ugly codes
           \begin{tabular}{p{\thu@title@width}@{}l@{\extracolsep{8pt}}l}
         \else
           \begin{tabular}{p{\thu@title@width}l@{}l}
         \fi
             \thu@put@title{\thu@department@title} & \thu@title@sep
               & \thu@cdepartment\\
             \thu@put@title{\thu@major@title}      & \thu@title@sep
               & \thu@cmajor\\
             \thu@put@title{\thu@author@title}     & \thu@title@sep
               & \thu@cauthor \\
             \thu@put@title{\thu@supervisor@title} & \thu@title@sep
               & \thu@csupervisor\\
             \ifx\thu@cassosupervisor\@empty\else%
               \thu@put@title{\thu@assosuper@title} & \thu@title@sep
               & \thu@cassosupervisor\\
             \fi
           \end{tabular}
        }}
    \else
    % 封面标题之下的信息（中文）
      % \vskip 5bp
    \parbox[t][5cm][t]{\textwidth}{{\sanhao[1.5]
      \begin{center}\fangsong
        \setlength{\thu@title@width}{5em}
        \setlength{\extrarowheight}{4pt}
        \ifxetex % todo: ugly codes
          \begin{tabular}{p{\thu@title@width}@{}c@{\extracolsep{8pt}}l}
        \else
          \begin{tabular}{p{\thu@title@width}c@{\extracolsep{4pt}}l}
        \fi
        % \hline
            \thu@put@title{\thu@author@title}      & \thu@title@sep
            & {\ziju{0.6875}\thu@cauthor}\\

            \thu@put@title{\thu@major@title}       & \thu@title@sep
              & {\ziju{0.1875}\thu@cmajor}\\

              \thu@put@title{\thu@supervisor@title}  & \thu@title@sep
              & {\ziju{0.6875}\thu@csupervisor}\\
            \ifx\thu@cassosupervisor\@empty\else
              \thu@put@title{\thu@assosuper@title} &  \thu@title@sep
              & {\ziju{0.6875}\thu@cassosupervisor}\\
              \fi
            \ifx\thu@ccosupervisor\@empty\else
              \hfill\makebox[0pt][r]{\thu@cosuper@title} &  \thu@title@sep
              & {\ziju{0.6875}\thu@ccosupervisor}\\
            \fi
            \thu@put@title{\thu@department@title}  & \thu@title@sep
              & {\ziju{0.1875}\thu@cdepartment}\\
          \end{tabular}
      \end{center}}}
    \fi
    % 日期和资助信息
    \begin{center}
      \ifthu@bachelor\vskip-1.0cm\xiaosi\else
      \vskip-0.5cm\sanhao\fi
      \begin{table}[!b]
        \ifxetex % todo: ugly codes
          \begin{tabular*}{\hsize}{@{}@{\extracolsep{\fill}}c@{}}
        \else
          \begin{tabular}{\textwidth}{c}
        \fi
          %项目资助
          \ifx\thu@cproject\@empty\else
            \parbox[t][1cm][t]{\textwidth}
            {
            \renewcommand{\baselinestretch}{1.3}
            \begin{center}
            \wuhao[1.2]{\heiti{本研论文研究得到了 \thu@cproject 资助}}
            \end{center}
            }\fi \\
          \thu@cdate\\
        \end{tabular*}
      \end{table}
    \end{center}
    \end{center}} % end of titlepage

% 英文标题页
\newcommand{\thu@engcover}{%
  \newif\ifthu@professional\thu@professionalfalse
  \ifthu@master
    \ifthenelse{\equal{\thu@edegree}{\thu@master@art}}
      {\relax}
      {\ifthenelse{\equal{\thu@edegree}{\thu@master@sci}}
        {\relax}
        {\thu@professionaltrue}}
  \fi
  \ifthu@doctor
    \ifthenelse{\equal{\thu@edegree}{\thu@doctor@phi}}
      {\relax}
      {\thu@professionaltrue}
  \fi
  \begin{center}
    \vspace*{-2cm}
    % Dissertation
    \parbox[t][6cm][t]{\textwidth}{
      \renewcommand{\baselinestretch}{1.3}
      \begin{center}
        \sanhao%
        A Dissertation Submitted to \thu@euniversity \\
        For the 
        \ifthu@master Master \else Doctor \fi
        Degree of \thu@edegree
      \end{center}}
    % 英文标题
    \parbox[t][8cm][t]{\textwidth}{
      \renewcommand{\baselinestretch}{1.5}
      \begin{center}
        \erhao[1.1]\bfseries\sffamily\thu@etitle%
      \end{center}}
    % 封面标题之下的信息（英文）
      % \vskip 5bp
      \parbox[t][6cm][t]{\textwidth}{{\sanhao[1.5]
        \begin{center}\fangsong
          \setlength{\thu@title@width}{10em}
          \setlength{\extrarowheight}{4pt}
          \ifxetex % todo: ugly codes
            \begin{tabular}{rc@{\extracolsep{8pt}}l}
          \else
            \begin{tabular}{rc@{\extracolsep{4pt}}l}
          \fi
          % \hline
              \thu@author@etitle     & \thu@title@sep
              & {\ziju{0.6875}\thu@eauthor}\\
              \thu@major@etitle       & \thu@title@sep
                & {\ziju{0.1875}\thu@emajor}\\
                \thu@supervisor@etitle  & \thu@title@sep
                & {\ziju{0.6875}\thu@esupervisor}\\
              \ifx\thu@cassosupervisor\@empty\else
                % \thu@assosuper@etitle &  \thu@title@sep
                &
                & {\ziju{0.6875}\thu@eassosupervisor}\\
                \fi
              \ifx\thu@ccosupervisor\@empty\else
              % \thu@cosuper@etitle &  \thu@title@sep
              &
                & {\ziju{0.6875}\thu@ecosupervisor}\\
              \fi
            \end{tabular}
        \end{center}}}

    % 日期和单位以及地址
    \begin{center}
      \ifthu@bachelor\vskip-1.0cm\xiaosi\else
      \vskip-0.5cm\sanhao\fi
      \begin{table}[!b]
        \ifxetex % todo: ugly codes
          \begin{tabular*}{\hsize}{@{}@{\extracolsep{\fill}}lcr@{}}
        \else
          \begin{tabular}{\textwidth}{c}
        \fi
        & \thu@euniversity & \\
        & \thu@eaddress & \\
        % & \thu@edate & \\
        \end{tabular*}
      \end{table}
    \end{center}

  \end{center}}
\newcommand{\thu@authorization@mk}{%
  \ifthu@bachelor\vspace*{0.2cm}\else\vspace*{0.42cm}\fi % shit code!
  \begin{center}\erhao\heiti\thu@authtitle\end{center}
  \ifthu@bachelor\vskip5pt\else\vskip40pt\sihao[2.03]\fi\par
  \thu@authorization\par
  \textbf{\thu@authorizationaddon}\par
  \ifthu@bachelor\vskip0.7cm\else\vskip1.0cm\fi
  \ifthu@bachelor
    \indent\mbox{\thu@authorsig\thu@underline\relax%
    \thu@teachersig\thu@underline\relax\thu@frontdate\thu@underline\relax}
  \else
    \begingroup
      \parindent0pt\xiaosi
      \hspace*{1.5cm}\thu@authorsig\thu@underline[7em]\relax\hfill%
                     \thu@teachersig\thu@underline[7em]\relax\hspace*{1cm}\\[3pt]
      \hspace*{1.5cm}\thu@frontdate\thu@underline[7em]\relax\hfill%
                     \thu@frontdate\thu@underline[7em]\relax\hspace*{1cm}
    \endgroup
  \fi}
% 封面
\def\makecover{%
\thu@setup@pdfinfo\thu@makecover}
\def\thu@setup@pdfinfo{%
  \hypersetup{%
    pdftitle={\thu@ctitle},
    pdfauthor={\thu@cauthor},
    pdfsubject={\thu@cdegree},
    pdfkeywords={\thu@ckeywords},
    pdfcreator={\thuthesis-v\version}}}
\NewDocumentCommand{\thu@makecover}{o}{
  \phantomsection
  \pdfbookmark[-1]{\thu@ctitle}{ctitle}
  \normalsize%
  \begin{titlepage}
    \thu@first@titlepage
    \ifthu@bachelor\relax\else
      \ifthu@postdoctor\relax\else
        \cleardoublepage\thu@engcover
    \fi\fi
    \ifthu@postdoctor\relax\else%
      \ifthu@bachelor\clearpage\else\cleardoublepage\fi%
      \IfNoValueTF{#1}{%
        \ifthu@bachelor\thu@authorization@mk\else%
          \begin{list}{}{%
            \topsep\z@%
            \listparindent\parindent%
            \parsep\parskip%
            \setlength{\leftmargin}{0.9mm}%
            \setlength{\rightmargin}{0.9mm}}%
          \item[]\thu@authorization@mk%
          \end{list}%
        \fi%
      }{%
        \includepdf{#1}%
      }%
    \fi
  \end{titlepage}
  \normalsize
  \thu@makeabstract
  \let\@tabular\thu@tabular}
\newbox\thu@kw
\newcommand\thu@put@keywords[2]{%
  \begingroup
    \setbox\thu@kw=\hbox{#1}
    \ifthu@bachelor\indent\else\noindent\hangindent\wd\thu@kw\hangafter1\fi%
    \box\thu@kw#2\par
  \endgroup}
\newcommand{\thu@makeabstract}{%
  \ifthu@bachelor\clearpage\else\cleardoublepage\fi
  \thu@chapter*[]{\cabstractname} % no tocline
  \ifthu@bachelor
    \pagestyle{thu@plain}
  \else
    \pagestyle{thu@headings}
  \fi
  \pagenumbering{arabic}
  \thu@cabstract
  \vskip12bp
  \thu@put@keywords{\textbf\thu@ckeywords@title}{\thu@ckeywords}
  \thu@chapter*[]{\eabstractname} % no tocline
  \thu@eabstract
  \vskip12bp
  \thu@put@keywords{%
    \textbf{\ifthu@bachelor Keywords:\else Key words:\fi\enskip}}{\thu@ekeywords}}
\newenvironment{denotation}[1][2.5cm]{%
  \thu@chapter*[]{\thu@denotation@name} % no tocline
  \vskip-30bp\xiaosi[1.6]\begin{thu@denotation}[labelwidth=#1]
}{%
  \end{thu@denotation}
}
\newlist{thu@denotation}{description}{1}
\setlist[thu@denotation]{%
  nosep,
  font=\normalfont,
  align=left,
  leftmargin=!, % sum of the following 3 lengths
  labelindent=0pt,
  labelwidth=2.5cm,
  labelsep*=0.5cm,
  itemindent=0pt,
}
\NewDocumentEnvironment{acknowledgement}{o}{%
    \thu@chapter*{\thu@ackname}
  }
  {
    \ifthu@postdoctor\relax\else%
      \IfNoValueTF{#1}{%
        \thu@chapter*{\thu@declarename}
        \par{\xiaosi\parindent2em\thu@declaretext}\vskip2cm
        {\xiaosi\hfill\thu@signature\thu@underline[2.5cm]\relax%
         \thu@backdate\thu@underline[2.5cm]\relax}%
      }{%
        \includepdf[pagecommand={\thispagestyle{thu@empty}%
          \phantomsection\addcontentsline{toc}{chapter}{\thu@declarename}%
        }]{#1}%
      }%
    \fi
  }
\let\ack\acknowledgement
\let\endack\endacknowledgement
\def\thu@starttoc#1{% #1: float type, prepend type name in \listof*** entry.
  \let\oldnumberline\numberline
  \def\numberline##1{\oldnumberline{\csname #1name\endcsname\hskip.4em ##1}}
  \@starttoc{\csname ext@#1\endcsname}
  \let\numberline\oldnumberline}
\def\thu@listof#1{% #1: float type
  \@ifstar
    {\thu@chapter*[]{\csname list#1name\endcsname}\thu@starttoc{#1}}
    {\thu@chapter*{\csname list#1name\endcsname}\thu@starttoc{#1}}}
\renewcommand\listoffigures{\thu@listof{figure}}
\renewcommand*\l@figure{\ifthu@bachelor\relax\else\addvspace{6bp}\fi\@dottedtocline{1}{0em}{4em}}
\renewcommand\listoftables{\thu@listof{table}}
\let\l@table\l@figure
\def\ext@equation{loe}
\def\equcaption#1{%
  \addcontentsline{\ext@equation}{equation}%
                  {\protect\numberline{#1}}}
\newcommand\listofequations{\thu@listof{equation}}
\let\l@equation\l@figure
\newcommand\bibstyle@inline{\bibpunct{[}{]}{,}{n}{,}{,}}
\DeclareRobustCommand\inlinecite{\@inlinecite}
\def\@inlinecite#1{\begingroup\let\@cite\NAT@citenum\citep{#1}\endgroup}
\let\onlinecite\inlinecite
\renewcommand\bibsection{\thu@chapter*{\bibname}}
\renewcommand\bibfont{\ifthu@bachelor\wuhao[1.619]\else\wuhao[1.5]\fi}
% 设置参考文献字体
% \DeclareFieldFormat[article]{title}{\fontspec{Arial}{#1}}
\setlength\bibhang{2\ccwd}
\addtolength{\bibsep}{-0.7em}
\setlength{\labelsep}{0.4em}
\expandafter\newcommand\csname bibstyle@thuthesis-numeric\endcsname{%
  \bibpunct{[}{]}{,}{s}{,}{\textsuperscript{,}}}
\expandafter\newcommand\csname bibstyle@thuthesis-author-year\endcsname{%
  \bibpunct{(}{)}{;}{a}{,}{,}}
\patchcmd\NAT@citexnum{%
  \@ifnum{\NAT@ctype=\z@}{%
    \if*#2*\else\NAT@cmt#2\fi
  }{}%
  \NAT@mbox{\NAT@@close}%
}{%
  \NAT@mbox{\NAT@@close}%
  \@ifnum{\NAT@ctype=\z@}{%
    \if*#2*\else\textsuperscript{#2}\fi
  }{}%
}{}{}
\renewcommand\NAT@citesuper[3]{\ifNAT@swa
  \if*#2*\else#2\NAT@spacechar\fi
\unskip\kern\p@\textsuperscript{\NAT@@open#1\NAT@@close\if*#3*\else#3\fi}%
   \else #1\fi\endgroup}
\patchcmd{\NAT@citex}{%
  \if*#2*\else\NAT@cmt#2\fi
  \if\relax\NAT@date\relax\else\NAT@@close\fi
}{%
  \if\relax\NAT@date\relax\else\NAT@@close\fi
  \if*#2*\else\textsuperscript{#2}\fi
}{}{}
\renewcommand\NAT@cite%
    [3]{\ifNAT@swa\NAT@@open\if*#2*\else#2\NAT@spacechar\fi
        #1\NAT@@close\if*#3*\else\textsuperscript{#3}\fi\else#1\fi\endgroup}
\let\thu@appendix\appendix
\renewenvironment{appendix}{%
  \let\title\thu@appendix@title
  \thu@appendix}{%
  \let\title\@gobble}
\let\title\@gobble
\newcommand{\thu@appendix@title}[1]{%
  \begin{center}
    \xiaosi[1.667] #1
  \end{center}}
\newlist{translationbib}{enumerate}{1}
\setlist[translationbib]{label=[\arabic*],align=left,nosep,itemsep=6bp,
  leftmargin=10mm,labelsep=!,before=\vspace{0.5\baselineskip}\wuhao[1.3]}
\newenvironment{resume}[1][\thu@resume@title]{%
  \thu@chapter*{#1}}{}
\newcommand{\resumeitem}[1]{%
  \vspace{24bp}{\sihao\heiti\centerline{#1}}\par\vspace{6bp}}
\newcommand{\researchitem}[1]{%
  \vspace{32bp}{\sihao\heiti\centerline{#1}}\par\vspace{14bp}}
\newlist{publications}{enumerate}{1}
\setlist[publications]{label=[\arabic*],align=left,nosep,itemsep=8bp,
  leftmargin=10mm,labelsep=!,before=\xiaosi[1.26],resume}
\newlist{achievements}{enumerate}{1}
\setlist[achievements]{label=[\arabic*],align=left,nosep,itemsep=8bp,
  leftmargin=10mm,labelsep=!,before=\xiaosi[1.26]}
\def\publicationskip{\bigskip\bigskip}
\NewDocumentCommand{\shuji}{O{\thu@ctitle} O{\thu@cauthor}}{%
  \newpage\thispagestyle{empty}%
  \fangsong\ifxetex\addCJKfontfeatures*{RawFeature={vertical:}}\fi
  \xiaosan\ziju{0.4}%
  \noindent\hfill\rotatebox[origin=lt]{-90}{\makebox[\textheight]{#1\hfill#2}}}
\AtEndOfClass{\input{thuthesis.cfg}}
\AtEndOfClass{\sloppy}
\endinput
%%
%% End of file `thuthesis.cls'.
