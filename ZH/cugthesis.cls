%%
%% This is file `cugthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% cugthesis.dtx  (with options: `cls')
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
\ProvidesClass{cugthesis}
[2018/9/3 5.4.3 CUG Thesis Template]
\hyphenation{cug-Thesis}
\def\cugthesis{\textsc{cugThesis}}
\def\version{5.4.3}

\RequirePackage{kvoptions}
\SetupKeyvalOptions{
  family=cug,
  prefix=cug@,
  setkeys=\kvsetkeys}
\newif\ifcug@bachelor
\newif\ifcug@master
\newif\ifcug@doctor
\newif\ifcug@postdoctor
\define@key{cug}{degree}{%
  \cug@bachelorfalse
  \cug@masterfalse
  \cug@doctorfalse
  \cug@postdoctorfalse
  \expandafter\csname cug@#1true\endcsname}
\define@key{cug}{type}{%
  \ClassError{cugthesis}{'type' is deprecated, \MessageBreak
                         please use 'degree=#1' instead}{}}
\def\cug@deprecated@degree@option{%
  \ClassError{cugthesis}{Option '\CurrentOption' is deprecated, \MessageBreak
                         please use 'degree=\CurrentOption' instead}{}}
\DeclareVoidOption{bachelor}{\cug@deprecated@degree@option}
\DeclareVoidOption{master}{\cug@deprecated@degree@option}
\DeclareVoidOption{doctor}{\cug@deprecated@degree@option}
\DeclareVoidOption{postdoctor}{\cug@deprecated@degree@option}
\DeclareBoolOption{secret}
\DeclareBoolOption{arialtoc}
\DeclareBoolOption{arialtitle}
\IfFileExists{/dev/null}{}{\PassOptionsToClass{fontset=windowsold}{ctexbook}}
\DeclareBoolOption{raggedbottom}
\DeclareBoolOption{pifootnote}
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\kvsetkeys{cug}{%
  raggedbottom,
  arialtitle}
\ProcessKeyvalOptions*
\ifcug@bachelor\relax\else
  \ifcug@master\relax\else
    \ifcug@doctor\relax\else
      \ifcug@postdoctor\relax\else
        \ClassError{cugthesis}%
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
\ifcug@raggedbottom
  \RequirePackage[bottom,perpage,hang]{footmisc}
  \raggedbottom
\else
  \RequirePackage[perpage,hang]{footmisc}
\fi
\ifcug@pifootnote
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
  linkcolor=black, %green!55!blue,
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
\ifcug@bachelor
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
\let\cug@cleardoublepage\cleardoublepage
\newcommand{\cug@clearemptydoublepage}{%
  \clearpage{\pagestyle{cug@empty}\cug@cleardoublepage}}
\let\cleardoublepage\cug@clearemptydoublepage
\renewcommand\frontmatter{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmatterfalse
  \pagenumbering{Roman}
  \pagestyle{cug@empty}}
\renewcommand\mainmatter{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmattertrue
  \pagenumbering{arabic}
  \ifcug@bachelor\pagestyle{cug@plain}\else\pagestyle{cug@headings}\fi}
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
\def\cug@def@fontsize#1#2{%
  \expandafter\newcommand\csname #1\endcsname[1][1.3]{%
    \fontsize{#2}{##1\dimexpr #2}\selectfont}}
\cug@def@fontsize{chuhao}{42bp}
\cug@def@fontsize{xiaochu}{36bp}
\cug@def@fontsize{yihao}{26bp}
\cug@def@fontsize{xiaoyi}{24bp}
\cug@def@fontsize{erhao}{22bp}
\cug@def@fontsize{xiaoer}{18bp}
\cug@def@fontsize{sanhao}{16bp}
\cug@def@fontsize{xiaosan}{15bp}
\cug@def@fontsize{sihao}{14bp}
\cug@def@fontsize{banxiaosi}{13bp}
\cug@def@fontsize{xiaosi}{12bp}
\cug@def@fontsize{dawu}{11bp}
\cug@def@fontsize{wuhao}{10.5bp}
\cug@def@fontsize{xiaowu}{9bp}
\cug@def@fontsize{liuhao}{7.5bp}
\cug@def@fontsize{xiaoliu}{6.5bp}
\cug@def@fontsize{qihao}{5.5bp}
\cug@def@fontsize{bahao}{5bp}
\fancypagestyle{cug@empty}{%
  \fancyhf{}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}}
\fancypagestyle{cug@plain}{%
  \fancyhead{}
  \fancyfoot[C]{\xiaowu\thepage}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}}
\fancypagestyle{cug@headings}{%
  % 页眉设置
  \fancyhead{}
  \fancyhead[CO]{\cug@cuniversity\StrRight{\cug@cdegree}{2}学位论文}
  \fancyhead[CE]{\cug@cauthor\cug@title@sep\cug@ctitle}
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
\def\cug@textcircled#1{%
  \ifnum\value{#1} >9
    \ClassError{cugthesis}%
      {Too many footnotes in this page.}{Keep footnote less than 10.}
  \fi
  \ifcug@pifootnote%
    \ding{\the\numexpr\value{#1}+171\relax}%
  \else%
    \textcircled{\xiaoliu\arabic{#1}}%
  \fi}
\renewcommand{\thefootnote}{\cug@textcircled{footnote}}
\renewcommand{\thempfootnote}{\cug@textcircled{mpfootnote}}
\def\footnoterule{\vskip-3\p@\hrule\@width0.3\textwidth\@height0.4\p@\vskip2.6\p@}
\let\cug@footnotesize\footnotesize
\renewcommand\footnotesize{\cug@footnotesize\xiaowu[1.5]}
\footnotemargin1.5em\relax
\let\cug@makefnmark\@makefnmark
\def\cug@@makefnmark{\hbox{{\normalfont\@thefnmark}}}
\pretocmd{\@makefntext}{\let\@makefnmark\cug@@makefnmark}{}{}
\apptocmd{\@makefntext}{\let\@makefnmark\cug@makefnmark}{}{}
\allowdisplaybreaks[4]
\renewcommand\theequation{\ifnum \c@chapter>\z@ \thechapter-\fi\@arabic\c@equation}
\def\make@df@tag{\@ifstar\cug@make@df@tag@@\make@df@tag@@@}
\def\cug@make@df@tag@@#1{\gdef\df@tag{\cug@maketag{#1}\def\@currentlabel{#1}}}
\iffalse
\ifcug@bachelor
  \def\cug@maketag#1{\maketag@@@{%
    (\ignorespaces\text{\equationname\hskip0.5em}#1\unskip\@@italiccorr)}}
  \def\tagform@#1{\maketag@@@{%
    (\ignorespaces\text{\equationname\hskip0.5em}#1\unskip\@@italiccorr)\equcaption{#1}}}
\fi
\fi
\def\cug@maketag#1{\maketag@@@{(\ignorespaces #1\unskip\@@italiccorr)}}
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
\ifcug@bachelor
  \g@addto@macro\appendix{\renewcommand*{\thefigure}{\thechapter-\arabic{figure}}}
  \g@addto@macro\appendix{\renewcommand*{\thetable}{\thechapter-\arabic{table}}}
\fi
\let\old@tabular\@tabular
\def\cug@tabular{\dawu[1.5]\old@tabular}
% 图表标题字体设置为五号
\DeclareCaptionLabelFormat{cug}{{\wuhao[1.5]\normalfont #1~#2}}
\DeclareCaptionLabelSeparator{cug}{\hspace{1em}}
\DeclareCaptionFont{cug}{\wuhao[1.5]}
\captionsetup{labelformat=cug,labelsep=cug,font=cug}
% 表格标题字体设置
\captionsetup[table]{position=top,belowskip={12bp-\intextsep},aboveskip=6bp}
\captionsetup[figure]{position=bottom,belowskip={16bp-\intextsep},aboveskip=6bp}
\captionsetup[sub]{font=cug,skip=6bp}
% 定义图注字体为小五号
\DeclareCaptionFont{cug_fnote}{\xiaowu[1.5]}
% 图标题下方的图注
\newcommand\fnote[1]{\captionsetup{font=cug_fnote}\caption*{#1}}
\renewcommand{\thesubfigure}{(\alph{subfigure})}
\renewcommand{\thesubtable}{(\alph{subtable})}
\let\cug@LT@array\LT@array
\def\LT@array{\dawu[1.5]\cug@LT@array} % set default font size
\def\hlinewd#1{%
  \noalign{\ifnum0=`}\fi\hrule \@height #1 \futurelet
    \reserved@a\@xhline}
\def\cug@title@font{%
  \ifcug@arialtitle\rmfamily\else\heiti\fi}
\AtBeginDocument{%
  \pagestyle{cug@empty}
  \renewcommand{\chaptermark}[1]{\@mkboth{\CTEXthechapter\hskip\ccwd#1}{}}}
\newcommand\cug@chapter@titleformat[1]{%
  \ifcug@bachelor #1\else%
    \ifthenelse%
      {\equal{#1}{\eabstractname}}%
      {\bfseries #1}%
      {#1}%
  \fi}
  % 章标题设置
\ctexset{%
  chapter={
    afterindent=true, 
    pagestyle={\ifcug@bachelor cug@plain\else cug@headings\fi},
    beforeskip={\ifcug@bachelor 15bp\else 9bp\fi},
    aftername=\hskip\ccwd,
    afterskip={\ifcug@bachelor 20bp\else 24bp\fi},
    % 章标题字体设置
    format={\centering\cug@title@font\ifcug@bachelor\xiaosan[1.333]\else\sanhao[1]\bfseries\fi},
    nameformat=\relax,
    titleformat=\cug@chapter@titleformat,
    lofskip=0pt,
    lotskip=0pt,
  },
  % 一级节标题设置
  section={
    afterindent=true,
    beforeskip={\ifcug@bachelor 25bp\else 24bp\fi\@plus 1ex \@minus .2ex},
    afterskip={\ifcug@bachelor 12bp\else 6bp\fi \@plus .2ex},
    % 一级节标题字体设置
    format={\normalfont\ifcug@bachelor\sihao[1.286]\else\sihao[1.429]\bfseries\centering\fi},
  },
  subsection={
    afterindent=true,
    beforeskip={\ifcug@bachelor 12bp\else 16bp\fi\@plus 1ex \@minus .2ex},
    afterskip={6bp \@plus .2ex},
    % 二级节标题字体设置
    format={\heiti\ifcug@bachelor\xiaosi[1.25]\else\xiaosi[1.538]\fi},
    numberformat={\heiti\ifcug@bachelor\banxiaosi[1.154]\else\xiaosi[1.538]\fi},
  },
  subsubsection={
    afterindent=true,
    beforeskip={\ifcug@bachelor 12bp\else 16bp\fi\@plus 1ex \@minus .2ex},
    afterskip={6bp \@plus .2ex},
    format={\kaishu\ifcug@bachelor\xiaosi[1.25]\else\xiaosi[1.667]\fi},
  },
  paragraph/afterindent=true,
  subparagraph/afterindent=true}
\newcounter{cug@bookmark}
\NewDocumentCommand\cug@chapter{s o m o}{
  \IfBooleanF{#1}{%
    \ClassError{cugthesis}{You have to use the star form: \string\cug@chapter*}{}
  }%
  \if@openright\cleardoublepage\else\clearpage\fi\phantomsection%
  \IfValueTF{#2}{%
    \ifthenelse{\equal{#2}{}}{%
      \addtocounter{cug@bookmark}\@ne
      \pdfbookmark[0]{#3}{cugchapter.\thecug@bookmark}
    }{%
      \addcontentsline{toc}{chapter}{#3}
    }
  }{%
    \addcontentsline{toc}{chapter}{#3}
  }%
  \ifcug@bachelor \ctexset{chapter/beforeskip=25bp} \fi
  \chapter*{#3}%
  \ifcug@bachelor \ctexset{chapter/beforeskip=15bp} \fi
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
  % \cug@chapter*[]{\contentsname}
  \ifcug@bachelor\clearpage\else\cleardoublepage\fi
\begin{center}\sanhao\heiti\contentsname\end{center}
  \par
  \ifcug@bachelor\xiaosi[1.667]\else\xiaosi[1.65]\fi\@starttoc{toc}\normalsize}
\ifcug@arialtoc
  \def\cug@toc@font{\sffamily}
\fi
\def\@pnumwidth{2em}
\def\@tocrmarg{\@pnumwidth}
\def\@dotsep{1}
\patchcmd{\@dottedtocline}{#4}{\csname cug@toc@font\endcsname #4}{}{}
\patchcmd{\@dottedtocline}{\hb@xt@\@pnumwidth}{\hbox}{}{}
\renewcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \ifcug@bachelor \vskip 6bp \else \vskip 4bp \fi \@plus\p@
    \setlength\@tempdima{4em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      % numberline is called here, and it uses \@tempdima
      {\ifcug@bachelor\sffamily\else\csname cug@toc@font\endcsname\fi\heiti #1}
      \leaders\hbox{$\m@th\mkern \@dotsep mu\hbox{.}\mkern \@dotsep mu$}\hfill
      \nobreak{\normalfont\normalcolor #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}
\renewcommand*\l@section{%
  \@dottedtocline{1}{\ccwd}{2.1em}}
\renewcommand*\l@subsection{%
  \@dottedtocline{2}{\ifcug@bachelor 1.5\ccwd\else 2\ccwd\fi}{3em}}
\renewcommand*\l@subsubsection{%
  \@dottedtocline{3}{\ifcug@bachelor 2.4em\else 3.5em\fi}{3.8em}}
\def\cug@def@term#1{%
  \define@key{cug}{#1}{\csname #1\endcsname{##1}}
  \expandafter\gdef\csname #1\endcsname##1{%
    \expandafter\gdef\csname cug@#1\endcsname{##1}}
  \csname #1\endcsname{}}
\cug@def@term{secretlevel}
\cug@def@term{secretyear}
\cug@def@term{ctitle}
\cug@def@term{etitle}
\cug@def@term{cauthor}
\cug@def@term{studentnum}
\cug@def@term{csupervisor}
\cug@def@term{cassosupervisor}
\cug@def@term{ccosupervisor}
\cug@def@term{eauthor}
\cug@def@term{esupervisor}
\cug@def@term{eassosupervisor}
\cug@def@term{ecosupervisor}
\cug@def@term{cdegree}
\cug@def@term{edegree}
\cug@def@term{cuniversity}
\cug@def@term{euniversity}
\cug@def@term{cdepartment}
\cug@def@term{eaddress}
\cug@def@term{cproject}
\def\caffil{% for compatibility
  \ClassWarning{cugthesis}
    {'\string\caffil' is deprecated, please use '\string\cdepartment' instead.}{}%
  \cdepartment}
\cug@def@term{edepartment}
\def\eaffil{% for compability
  \ClassWarning{cugthesis}
    {'\string\eaffil' is deprecated, please use '\string\edepartment' instead.}{}%
  \edepartment}
\cug@def@term{cmajor}
\def\csubject{% for compatibility
  \ClassWarning{cugthesis}
    {'\string\csubject' is deprecated, please use '\string\cmajor' instead.}{}%
  \cmajor}
\cug@def@term{emajor}
\def\esubject{%for compability
  \ClassWarning{cugthesis}
    {'\string\esubject' is deprecated, please use '\string\emajor' instead.}{}%
  \emajor}
\cug@def@term{cdate}
\cug@def@term{edate}
\cug@def@term{id}
\cug@def@term{udc}
\cug@def@term{catalognumber}
\cug@def@term{cfirstdiscipline}
\cug@def@term{cseconddiscipline}
\cug@def@term{postdoctordate}
\newcommand{\cug@@CV}[1]{\long\gdef\cug@CV{#1}}
\newenvironment{CV}{\Collect@Body\cug@@CV}{}
\newcommand{\cug@@cabstract}[1]{\long\gdef\cug@cabstract{#1}}
\newenvironment{cabstract}{\Collect@Body\cug@@cabstract}{}
\newcommand{\cug@@eabstract}[1]{\long\gdef\cug@eabstract{#1}}
\newenvironment{eabstract}{\Collect@Body\cug@@eabstract}{}
\def\cug@parse@keywords#1{
  \define@key{cug}{#1}{\csname #1\endcsname{##1}}
  \expandafter\gdef\csname cug@#1\endcsname{}
  \expandafter\gdef\csname #1\endcsname##1{
    \@for\reserved@a:=##1\do{
      \expandafter\ifx\csname cug@#1\endcsname\@empty\else
        \expandafter\g@addto@macro\csname cug@#1\endcsname{%
          \ignorespaces\csname cug@#1@separator\endcsname}
      \fi
      \expandafter\expandafter\expandafter\g@addto@macro%
        \expandafter\csname cug@#1\expandafter\endcsname\expandafter{\reserved@a}}}}
\cug@parse@keywords{ckeywords}
\cug@parse@keywords{ekeywords}
\def\cugsetup{\kvsetkeys{cug}}
\newcommand\cug@underline[2][6em]{\hskip1pt\underline{\hb@xt@ #1{\hss#2\hss}}\hskip3pt}
\newlength{\cug@title@width}
\ifxetex % todo: ugly codes
  \newcommand{\cug@put@title}[2][\cug@title@width]{%
  \begin{CJKfilltwosides}[b]{#1}#2\end{CJKfilltwosides}}
\else
  \newcommand{\cug@put@title}[2][\cug@title@width]{%
  \begin{CJKfilltwosides}{#1}#2\end{CJKfilltwosides}}
\fi
\def\cug@first@titlepage{%
  \ifcug@postdoctor\cug@first@titlepage@postdoctor\else\cug@first@titlepage@other\fi}
\newcommand{\cug@first@titlepage@postdoctor}{
  \begin{center}
    \setlength{\cug@title@width}{3em}
    \vspace*{0.7cm}
    \begingroup\wuhao[1.5]%
    \cug@put@title{\cug@catalog@number@title}\cug@underline\cug@catalognumber\hfill%
    \cug@put@title{\cug@secretlevel}%
      \expandafter\cug@underline\ifcug@secret\cug@secret@content\else\relax\fi\par
    \cug@put@title{U D C}\cug@underline\cug@udc\hfill%
    \cug@put@title{\cug@id@title}\cug@underline\cug@id\par\vskip3cm\endgroup
    \begingroup\heiti
      {\xiaochu\ziju{1}\cug@cuniversity}\par\vskip2cm
      {\xiaoyi\ziju{1}\cug@postdoctor@report@title}\par\vskip3cm
      {\sanhao[1.5]\cug@ctitle}\par\vskip2cm
      {\xiaoer\cug@cauthor}
    \endgroup
    \par\vskip3cm
    {\xiaosan[1.5]\ziju{1}\cug@cuniversity\par\vskip0.5em\CJK@todaysmall@short}
  \end{center}
  \cleardoublepage
  \begin{center}
    \vspace*{2cm}
    {\sihao\heiti\cug@ctitle\par\cug@etitle}\par
    \parbox[t][7cm][b]{\textwidth-6cm}{\sihao[1.5]%
      \setlength{\cug@title@width}{11em}
      \setlength{\extrarowheight}{6pt}
      \ifxetex % todo: ugly codes
        \begin{tabular}{p{\cug@title@width}@{}l@{\extracolsep{8pt}}l}
      \else
        \begin{tabular}{p{\cug@title@width}l@{}l}
      \fi
          \cug@put@title{\cug@author@title}
            & \cug@title@sep
            & \cug@cauthor \\
          \cug@put@title{\cug@postdoctor@first@discipline@title}
            & \cug@title@sep
            & \cug@cfirstdiscipline\\
          \cug@put@title{\cug@postdoctor@second@discipline@title}
            & \cug@title@sep
            & \cug@cseconddiscipline\\
          \cug@put@title{\cug@supervisor@title}
            & \cug@title@sep
            & \cug@csupervisor\\
        \end{tabular}}
    \vskip2cm
    {\sihao\cug@postdoctor@date@title\hskip1em\underline\cug@postdoctordate}
  \end{center}}
\newcommand{\cug@first@titlepage@other}{
  \begin{center}
    % \vspace*{-2cm}
    % \parbox[b][2.4cm][t]{\textwidth}{%
    %   \ifcug@secret{\heiti\sanhao\cug@secretlevel\cug@secret@content}\else\rule{1cm}{0cm}\fi}
    \ifcug@bachelor
      \vskip0.65cm
      {\yihao\lishu\ziju{0.5}\cug@cuniversity}
      \par\vskip1.5cm
      {\xiaochu\heiti\ziju{0.5}\textbf\cug@bachelor@subtitle}
      \vskip2.2cm\hskip0.8cm
      \noindent\heiti\xiaoer\cug@bachelor@title@pre\cug@title@sep
      \parbox[t]{12cm}{%
      \ignorespaces\yihao[1.51]%
      \renewcommand{\CJKunderlinebasesep}{0.25cm}%
      \renewcommand{\ULthickness}{1.3pt}%
      \ifxetex
        \xeCJKsetup{underline/format=\color{black}}%
      \else
        \def\CJKunderlinecolor{\color{black}}%
      \fi
      \CJKunderline*{\cug@ctitle}}%
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
                学校代码  \cug@title@sep  10491 & 研究生学号 \cug@title@sep  \cug@studentnum\\
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
            \yihao[1.2]{\heiti\cug@cuniversity \\ \StrRight{\cug@cdegree}{2} 学位论文}\par%
            \par\vskip 18bp%
            \xiaoer[1]\textrm{\cug@apply}%
          \end{center}
        }
      \vskip0.8cm
      % 中文标题
      \parbox[t][5cm][t]{\paperwidth-8cm}
        {
          \renewcommand{\baselinestretch}{1.3}
          \begin{center} %中文标题
            \yihao[1.2]{\heiti\cug@ctitle}\par%
            \par\vskip 18bp%
            \xiaoer[1]\textrm{\cug@apply}%
          \end{center}
        }
    \fi
    \ifcug@bachelor
      \vskip0.75cm
      \ifx\cug@cassosupervisor\@empty%
        \def\cug@tempa{7.15cm}
      \else%
        \def\cug@tempa{8.15cm}
      \fi%
      \parbox[t][\cug@tempa][t]{\textwidth}{%
        {\fangsong\sanhao[1.95]%
         \hspace*{1.9cm}
         \setlength{\cug@title@width}{4em}
         \setlength{\extrarowheight}{6pt}
         \ifxetex % todo: ugly codes
           \begin{tabular}{p{\cug@title@width}@{}l@{\extracolsep{8pt}}l}
         \else
           \begin{tabular}{p{\cug@title@width}l@{}l}
         \fi
             \cug@put@title{\cug@department@title} & \cug@title@sep
               & \cug@cdepartment\\
             \cug@put@title{\cug@major@title}      & \cug@title@sep
               & \cug@cmajor\\
             \cug@put@title{\cug@author@title}     & \cug@title@sep
               & \cug@cauthor \\
             \cug@put@title{\cug@supervisor@title} & \cug@title@sep
               & \cug@csupervisor\\
             \ifx\cug@cassosupervisor\@empty\else%
               \cug@put@title{\cug@assosuper@title} & \cug@title@sep
               & \cug@cassosupervisor\\
             \fi
           \end{tabular}
        }}
    \else
    % 封面标题之下的信息（中文）
      % \vskip 5bp
    \parbox[t][5cm][t]{\textwidth}{{\sanhao[1.5]
      \begin{center}\fangsong
        \setlength{\cug@title@width}{5em}
        \setlength{\extrarowheight}{4pt}
        \ifxetex % todo: ugly codes
          \begin{tabular}{p{\cug@title@width}@{}c@{\extracolsep{8pt}}l}
        \else
          \begin{tabular}{p{\cug@title@width}c@{\extracolsep{4pt}}l}
        \fi
        % \hline
            \cug@put@title{\cug@author@title}      & \cug@title@sep
            & {\ziju{0.6875}\cug@cauthor}\\

            \cug@put@title{\cug@major@title}       & \cug@title@sep
              & {\ziju{0.1875}\cug@cmajor}\\

              \cug@put@title{\cug@supervisor@title}  & \cug@title@sep
              & {\ziju{0.6875}\cug@csupervisor}\\
            \ifx\cug@cassosupervisor\@empty\else
              \cug@put@title{\cug@assosuper@title} &  \cug@title@sep
              & {\ziju{0.6875}\cug@cassosupervisor}\\
              \fi
            \ifx\cug@ccosupervisor\@empty\else
              \hfill\makebox[0pt][r]{\cug@cosuper@title} &  \cug@title@sep
              & {\ziju{0.6875}\cug@ccosupervisor}\\
            \fi
            \cug@put@title{\cug@department@title}  & \cug@title@sep
              & {\ziju{0.1875}\cug@cdepartment}\\
          \end{tabular}
      \end{center}}}
    \fi
    % 日期和资助信息
    \begin{center}
      \ifcug@bachelor\vskip-1.0cm\xiaosi\else
      \vskip-0.5cm\sanhao\fi
      \begin{table}[!b]
        \ifxetex % todo: ugly codes
          \begin{tabular*}{\hsize}{@{}@{\extracolsep{\fill}}c@{}}
        \else
          \begin{tabular}{\textwidth}{c}
        \fi
          %项目资助
          \ifx\cug@cproject\@empty\else
            \parbox[t][1cm][t]{\textwidth}
            {
            \renewcommand{\baselinestretch}{1.3}
            \begin{center}
            \wuhao[1.2]{\heiti{本研论文研究得到了 \cug@cproject 资助}}
            \end{center}
            }\fi \\
          \cug@cdate\\
        \end{tabular*}
      \end{table}
    \end{center}
    \end{center}} % end of titlepage

% 英文标题页
\newcommand{\cug@engcover}{%
  \newif\ifcug@professional\cug@professionalfalse
  \ifcug@master
    \ifthenelse{\equal{\cug@edegree}{\cug@master@art}}
      {\relax}
      {\ifthenelse{\equal{\cug@edegree}{\cug@master@sci}}
        {\relax}
        {\cug@professionaltrue}}
  \fi
  \ifcug@doctor
    \ifthenelse{\equal{\cug@edegree}{\cug@doctor@phi}}
      {\relax}
      {\cug@professionaltrue}
  \fi
  \begin{center}
    \vspace*{-2cm}
    % Dissertation
    \parbox[t][6cm][t]{\textwidth}{
      \renewcommand{\baselinestretch}{1.3}
      \begin{center}
        \sanhao%
        A Dissertation Submitted to \cug@euniversity \\
        For the 
        \ifcug@master Master \else Doctor \fi
        Degree of \cug@edegree
      \end{center}}
    % 英文标题
    \parbox[t][8cm][t]{\textwidth}{
      \renewcommand{\baselinestretch}{1.5}
      \begin{center}
        \erhao[1.1]\bfseries\rmfamily\cug@etitle%
      \end{center}}
    % 封面标题之下的信息（英文）
      % \vskip 5bp
      \parbox[t][6cm][t]{\textwidth}{{\sanhao[1.5]
        \begin{center}\fangsong
          \setlength{\cug@title@width}{10em}
          \setlength{\extrarowheight}{4pt}
          \ifxetex % todo: ugly codes
            \begin{tabular}{rc@{\extracolsep{8pt}}l}
          \else
            \begin{tabular}{rc@{\extracolsep{4pt}}l}
          \fi
          % \hline
              \cug@author@etitle     & \cug@title@sep
              & {\ziju{0.6875}\cug@eauthor}\\
              \cug@major@etitle       & \cug@title@sep
                & {\ziju{0.1875}\cug@emajor}\\
                \cug@supervisor@etitle  & \cug@title@sep
                & {\ziju{0.6875}\cug@esupervisor}\\
              \ifx\cug@cassosupervisor\@empty\else
                % \cug@assosuper@etitle &  \cug@title@sep
                &
                & {\ziju{0.6875}\cug@eassosupervisor}\\
                \fi
              \ifx\cug@ccosupervisor\@empty\else
              % \cug@cosuper@etitle &  \cug@title@sep
              &
                & {\ziju{0.6875}\cug@ecosupervisor}\\
              \fi
            \end{tabular}
        \end{center}}}

    % 日期和单位以及地址
    \begin{center}
      \ifcug@bachelor\vskip-1.0cm\xiaosi\else
      \vskip-0.5cm\sanhao\fi
      \begin{table}[!b]
        \ifxetex % todo: ugly codes
          \begin{tabular*}{\hsize}{@{}@{\extracolsep{\fill}}lcr@{}}
        \else
          \begin{tabular}{\textwidth}{c}
        \fi
        & \cug@euniversity & \\
        & \cug@eaddress & \\
        % & \cug@edate & \\
        \end{tabular*}
      \end{table}
    \end{center}

  \end{center}}
\newcommand{\cug@original@mk}{%
  \ifcug@bachelor\vspace*{0.2cm}\else\vspace*{0.42cm}\fi % shit code!
  \begin{center}\sanhao\heiti\cug@origintitle\end{center}
  \ifcug@bachelor\vskip5pt\else\vskip40pt\sihao[2.03]\fi\par
  \cug@originalstatement\par
  % \textbf{\cug@authorizationaddon}\par
  \ifcug@bachelor\vskip0.7cm\else\vskip1.0cm\fi
  \ifcug@bachelor
    \indent\mbox{\cug@authorsig\cug@underline\relax%
    \cug@teachersig\cug@underline\relax\cug@frontdate\cug@underline\relax}
  \else
  \begingroup
  \parindent0pt
  \begin{flushright}
    \vspace{1cm}
    \cug@authorsig\cug@underline[8em]\relax\hspace*{1cm}\\[3pt]
    \vspace{1cm}
    % \cug@frontdate\cug@underline[7em]\relax\hspace*{1cm}
    \cug@frontdate \hspace{3em}年\hspace{3em}月\hspace{3em}日
  \end{flushright}
  \endgroup
  \fi
  }
  \newcommand{\cug@commitment@mk}{%
  \ifcug@bachelor\vspace*{0.2cm}\else\vspace*{0.42cm}\fi % shit code!
  \begin{center}\sanhao\heiti\cug@commitmenttitle\end{center}
  \ifcug@bachelor\vskip5pt\else\vskip40pt\sihao[2.03]\fi\par
  \cug@commitment\par
  % \textbf{\cug@authorizationaddon}\par
  \ifcug@bachelor\vskip0.7cm\else\vskip1.0cm\fi
  \ifcug@bachelor
    \indent\mbox{\cug@authorsig\cug@underline\relax%
    \cug@teachersig\cug@underline\relax\cug@frontdate\cug@underline\relax}
  \else
  \begingroup
  \parindent0pt
  \begin{flushright}
    \vspace{1cm}
    \cug@teachersig\cug@underline[8.5em]\relax\hspace*{1cm}\\[3pt]
    \vspace{1cm}
    % \cug@frontdate\cug@underline[7em]\relax\hspace*{1cm}
    \cug@frontdate \hspace{3em}年\hspace{3em}月\hspace{3em}日
  \end{flushright}
  \endgroup
  \fi
  }
\newcommand{\cug@authorization@mk}{%
  \ifcug@bachelor\vspace*{0.2cm}\else\vspace*{0.42cm}\fi % shit code!
  \begin{center}\sanhao\heiti\cug@authtitle\end{center}
  \ifcug@bachelor\vskip5pt\else\vskip40pt\sihao[2.03]\fi\par
  \cug@authorization\par
  % \textbf{\cug@authorizationaddon}\par
  \ifcug@bachelor\vskip0.7cm\else\vskip1.0cm\fi
  \ifcug@bachelor
    \indent\mbox{\cug@authorsig\cug@underline\relax%
    \cug@teachersig\cug@underline\relax\cug@frontdate\cug@underline\relax}
  \else
    \begingroup
    \parindent0pt
    \begin{flushright}
      \vspace{1cm}
      \cug@authorsig\cug@underline[8em]\relax\hspace*{1cm}\\[3pt]
      \vspace{1cm}
      % \cug@frontdate\cug@underline[7em]\relax\hspace*{1cm}
      \cug@frontdate \hspace{3em}年\hspace{3em}月\hspace{3em}日
    \end{flushright}
    \endgroup
  \fi}
% 封面
\def\makecover{%
\cug@setup@pdfinfo\cug@makecover}
\def\cug@setup@pdfinfo{%
  \hypersetup{%
    pdftitle={\cug@ctitle},
    pdfauthor={\cug@cauthor},
    pdfsubject={\cug@cdegree},
    pdfkeywords={\cug@ckeywords},
    pdfcreator={\cugthesis-v\version}}}
\NewDocumentCommand{\cug@makecover}{o}{
  \phantomsection
  \pdfbookmark[-1]{\cug@ctitle}{ctitle}
  \normalsize%
  \begin{titlepage}
    \cug@first@titlepage
    \ifcug@bachelor\relax\else
      \ifcug@postdoctor\relax\else
        \cleardoublepage\cug@engcover
    \fi\fi
    % 原创性申明
    \ifcug@postdoctor\relax\else%
      \ifcug@bachelor\clearpage\else\cleardoublepage\fi%
      \IfNoValueTF{#1}{%
        \ifcug@bachelor\cug@original@mk\else%
          \begin{list}{}{%
            \topsep\z@%
            \listparindent\parindent%
            \parsep\parskip%
            \setlength{\leftmargin}{0.9mm}%
            \setlength{\rightmargin}{0.9mm}}%
          \item[]\cug@original@mk%
          \end{list}%
        \fi%
      }{%
        \includepdf{#1}%
      }%
    \fi
    % 导师承诺书
    \ifcug@postdoctor\relax\else%
      \ifcug@bachelor\clearpage\else\cleardoublepage\fi%
      \IfNoValueTF{#1}{%
        \ifcug@bachelor\cug@commitment@mk\else%
          \begin{list}{}{%
            \topsep\z@%
            \listparindent\parindent%
            \parsep\parskip%
            \setlength{\leftmargin}{0.9mm}%
            \setlength{\rightmargin}{0.9mm}}%
          \item[]\cug@commitment@mk%
          \end{list}%
        \fi%
      }{%
        \includepdf{#1}%
      }%
    \fi
    % 使用授权说明
    \ifcug@postdoctor\relax\else%
      \ifcug@bachelor\clearpage\else\cleardoublepage\fi%
      \IfNoValueTF{#1}{%
        \ifcug@bachelor\cug@authorization@mk\else%
          \begin{list}{}{%
            \topsep\z@%
            \listparindent\parindent%
            \parsep\parskip%
            \setlength{\leftmargin}{0.9mm}%
            \setlength{\rightmargin}{0.9mm}}%
          \item[]\cug@authorization@mk%
          \end{list}%
        \fi%
      }{%
        \includepdf{#1}%
      }%
    \fi
  \end{titlepage}
  \normalsize
  % 作者简介：需要清除页眉和页码
  \cug@makeresume
  % 摘要
  \cug@makeabstract
  \let\@tabular\cug@tabular}
\newbox\cug@kw
\newcommand{\cug@makeresume}
  {%
      \ifcug@bachelor\clearpage\else\clearpage\fi
      % \cug@chapter*[]{\cug@resume@title} % no tocline
      \ifcug@bachelor\vspace*{0.2cm}\else\vspace*{0.42cm}\fi % shit code!

      \begin{center}\sanhao\heiti\cug@resume@title\end{center}
      \ifcug@bachelor\vskip5pt\else\vskip40pt\sihao[2.03]\fi\par
      % 作者简介
      \xiaosi
      \cug@CV
      
  }
\newcommand\cug@put@keywords[2]{%
  \begingroup
    \setbox\cug@kw=\hbox{#1}
    \ifcug@bachelor\indent\else\noindent\hangindent\wd\cug@kw\hangafter1\fi%
    \box\cug@kw#2\par
  \endgroup}
\newcommand{\cug@makeabstract}
  {%
    \ifcug@bachelor\clearpage\else\cleardoublepage\fi
    % \cug@chapter*[]{\cabstractname} % no tocline
  \begin{center}\xiaoer\heiti\cabstractname\end{center}

    \ifcug@bachelor
      \pagestyle{cug@plain}
    \else
      \pagestyle{empty}
    \fi
    % \pagestyle{empty}
    % \pagenumbering{arabic}
    \xiaosi
    \cug@cabstract
    \vskip12bp
    \cug@put@keywords{\textbf\cug@ckeywords@title}{\cug@ckeywords}
    % \cug@chapter*[]{\eabstractname} % no tocline
    % 新开一页
    \ifcug@bachelor\clearpage\else\clearpage\fi
  \begin{center}\xiaoer\rmfamily\textbf{\eabstractname}\end{center}
    \par
    \xiaosi
    \cug@eabstract
    \vskip12bp
    \cug@put@keywords{%
      \textbf{\ifcug@bachelor Keywords:\else Key words:\fi\enskip}}{\cug@ekeywords}
  }
\newenvironment{denotation}[1][2.5cm]{%
  \cug@chapter*[]{\cug@denotation@name} % no tocline
  \vskip-30bp\xiaosi[1.6]\begin{cug@denotation}[labelwidth=#1]
}{%
  \end{cug@denotation}
}
\newlist{cug@denotation}{description}{1}
\setlist[cug@denotation]{%
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
    \cug@chapter*{\cug@ackname}
  }
  {
    \ifcug@postdoctor\relax\else%
      \IfNoValueTF{#1}{%
        \cug@chapter*{\cug@declarename}
        \par{\xiaosi\parindent2em\cug@declaretext}\vskip2cm
        {\xiaosi\hfill\cug@signature\cug@underline[2.5cm]\relax%
         \cug@backdate\cug@underline[2.5cm]\relax}%
      }{%
        \includepdf[pagecommand={\thispagestyle{cug@empty}%
          \phantomsection\addcontentsline{toc}{chapter}{\cug@declarename}%
        }]{#1}%
      }%
    \fi
  }
\let\ack\acknowledgement
\let\endack\endacknowledgement
\def\cug@starttoc#1{% #1: float type, prepend type name in \listof*** entry.
  \let\oldnumberline\numberline
  \def\numberline##1{\oldnumberline{\csname #1name\endcsname\hskip.4em ##1}}
  \@starttoc{\csname ext@#1\endcsname}
  \let\numberline\oldnumberline}
\def\cug@listof#1{% #1: float type
  \@ifstar
    {\cug@chapter*[]{\csname list#1name\endcsname}\cug@starttoc{#1}}
    {\cug@chapter*{\csname list#1name\endcsname}\cug@starttoc{#1}}}
\renewcommand\listoffigures{\cug@listof{figure}}
\renewcommand*\l@figure{\ifcug@bachelor\relax\else\addvspace{6bp}\fi\@dottedtocline{1}{0em}{4em}}
\renewcommand\listoftables{\cug@listof{table}}
\let\l@table\l@figure
\def\ext@equation{loe}
\def\equcaption#1{%
  \addcontentsline{\ext@equation}{equation}%
                  {\protect\numberline{#1}}}
\newcommand\listofequations{\cug@listof{equation}}
\let\l@equation\l@figure
\newcommand\bibstyle@inline{\bibpunct{[}{]}{,}{n}{,}{,}}
\DeclareRobustCommand\inlinecite{\@inlinecite}
\def\@inlinecite#1{\begingroup\let\@cite\NAT@citenum\citep{#1}\endgroup}
\let\onlinecite\inlinecite
\renewcommand\bibsection{\cug@chapter*{\bibname}}
\renewcommand\bibfont{\ifcug@bachelor\wuhao[1.619]\else\wuhao[1.5]\fi}
% 设置参考文献字体
% \DeclareFieldFormat[article]{title}{\fontspec{Arial}{#1}}
\setlength\bibhang{2\ccwd}
\addtolength{\bibsep}{-0.7em}
\setlength{\labelsep}{0.4em}
\expandafter\newcommand\csname bibstyle@cugthesis-numeric\endcsname{%
  \bibpunct{[}{]}{,}{s}{,}{\textsuperscript{,}}}
\expandafter\newcommand\csname bibstyle@cugthesis-author-year\endcsname{%
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
\let\cug@appendix\appendix
\renewenvironment{appendix}{%
  \let\title\cug@appendix@title
  \cug@appendix}{%
  \let\title\@gobble}
\let\title\@gobble
\newcommand{\cug@appendix@title}[1]{%
  \begin{center}
    \xiaosi[1.667] #1
  \end{center}}
\newlist{translationbib}{enumerate}{1}
\setlist[translationbib]{label=[\arabic*],align=left,nosep,itemsep=6bp,
  leftmargin=10mm,labelsep=!,before=\vspace{0.5\baselineskip}\wuhao[1.3]}
\newenvironment{resume}[1][\cug@resume@title]{%
  \cug@chapter*{#1}}{}
\newcommand{\resumeitem}[1]{%
  \vspace{24bp}{\sihao\heiti\centerline{#1}}\par\vspace{6bp}}
\newcommand{\researchitem}[1]{%
  \vspace{32bp}{\xiaosi\heiti\centerline{#1}}\par\vspace{14bp}}
\newcommand{\cvitem}[1]{%
\vspace{32bp}{\xiaosi\noindent\heiti{#1}}\par\vspace{14bp}}
\newlist{publications}{enumerate}{1}
\setlist[publications]{label=[\arabic*],align=left,nosep,itemsep=8bp,
  leftmargin=10mm,labelsep=!,before=\xiaosi[1.26],resume}
\newlist{achievements}{enumerate}{1}
\setlist[achievements]{label=[\arabic*],align=left,nosep,itemsep=8bp,
  leftmargin=10mm,labelsep=!,before=\xiaosi[1.26]}
\def\publicationskip{\bigskip\bigskip}
\NewDocumentCommand{\shuji}{O{\cug@ctitle} O{\cug@cauthor}}{%
  \newpage\thispagestyle{empty}%
  \fangsong\ifxetex\addCJKfontfeatures*{RawFeature={vertical:}}\fi
  \xiaosan\ziju{0.4}%
  \noindent\hfill\rotatebox[origin=lt]{-90}{\makebox[\textheight]{#1\hfill#2}}}
\AtEndOfClass{\input{cugthesis.cfg}}
\AtEndOfClass{\sloppy}
\endinput
%%
%% End of file `cugthesis.cls'.
