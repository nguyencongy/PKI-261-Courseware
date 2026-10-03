%%% hcmut-textbook.cls — lớp tài liệu CHUNG cho các giáo trình HCMUT (dùng chung nhiều môn)
%%% HCMUT, Khoa Khoa học và Kỹ thuật Máy tính
%%% Kế thừa toàn bộ bộ môi trường tiếng Việt của template Kenett–Zacks,
%%% chuyển engine sang LuaLaTeX để xử lý dấu tiếng Việt an toàn.
%%% Biên dịch: lualatex (KHÔNG dùng pdflatex — utf8x/vietnam đã lỗi thời)

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hcmut-textbook}[2026/07/24 v0.1 CO2011 textbook class]

% ---- tùy chọn -------------------------------------------------------------
\newif\ifMMdraft   \MMdraftfalse   % [draft]  : toán inline tô xanh để soát bài
\newif\ifMMsolution \MMsolutionfalse % [solution]: in kèm lời giải
\DeclareOption{draft}{\MMdrafttrue}
\DeclareOption{solution}{\MMsolutiontrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass[a4paper,11pt,twoside]{book}

% ---- ngôn ngữ và font ----------------------------------------------------
\RequirePackage{fontspec}
\RequirePackage{polyglossia}
\setdefaultlanguage{vietnamese}
\setotherlanguage{english}

% Font chính: TeX Gyre Schola — serif thân dày kiểu sách giáo khoa, CÓ SẴN trong
% mọi bản TeX Live (nên máy tác giả và CI render y hệt) và phủ ĐỦ dấu tiếng Việt
% (đã kiểm: 0 glyph thiếu cho toàn bộ bảng nguyên âm có dấu).
% KHÔNG dùng XCharter: bản OTF trên nhiều bản TeX Live — kể cả runner CI — THIẾU
% các glyph tiếng Việt precomposed (ả, ể, ủ, ...) nên gây lỗi thiếu glyph khi build.
\setmainfont{texgyreschola}[Extension=.otf,
  UprightFont=*-regular, BoldFont=*-bold,
  ItalicFont=*-italic, BoldItalicFont=*-bolditalic, Ligatures=TeX]%
\def\MMfontname{TeX Gyre Schola}%
% Bộ nhận diện quy định Myriad Pro cho ấn phẩm, nhưng Myriad Pro là font
% thương mại của Adobe, không phân phối lại được cùng một giáo trình mở.
% Source Sans 3 là font humanist mở của Adobe, cùng nhà thiết kế
% (Robert Slimbach) và cùng dòng chữ humanist — gần Myriad Pro nhất trong số
% font tự do. Lùi về TeX Gyre Heros nếu máy chưa có.
\IfFontExistsTF{Source Sans 3}{%
\setsansfont{Source Sans 3}[
    UprightFont = {* Regular},
    BoldFont = {* Bold},
    ItalicFont = {* Italic},
    BoldItalicFont = {* Bold Italic},
    Scale=0.94
]%
  \def\MMsansname{Source Sans 3}%
}{%
  \setsansfont{texgyreheros}[Extension=.otf, UprightFont=*-regular,
    BoldFont=*-bold, ItalicFont=*-italic, BoldItalicFont=*-bolditalic, Scale=0.92]%
  \def\MMsansname{TeX Gyre Heros (dự phòng)}%
}
\setmonofont{texgyrecursor}[Extension=.otf,
  UprightFont=*-regular, BoldFont=*-bold,
  ItalicFont=*-italic, BoldItalicFont=*-bolditalic, Scale=0.90]

\RequirePackage{unicode-math}
\setmathfont{latinmodern-math.otf}

% ---- microtype: co giãn ký tự (font expansion) + protrusion. Giảm MẠNH overfull
% và căn lề đều/đẹp hơn — chuyên nghiệp hơn \sloppy (KHÔNG làm lỏng giãn cách từ).
% LuaLaTeX + OTF hỗ trợ đầy đủ cả protrusion lẫn expansion.
\RequirePackage{microtype}
\microtypesetup{protrusion=true}
\ifdefined\directlua\microtypesetup{expansion=true}\fi% expansion chỉ chạy trên LuaLaTeX (engine chuẩn/CI); XeLaTeX chỉ protrusion, không lỗi
% Lưới an toàn cuối: cho phép giãn thêm ở ca khó để chữ KHÔNG thòi ra lề (overfull).
\setlength{\emergencystretch}{3em}

% ---- HỆ THỐNG MÀU -------------------------------------------------------
% Triết lý: HCMUT là màu CHỦ, kỷ luật màu theo chuẩn NXB hàng đầu (MIT Press).
% Nguyên tắc: MỘT màu thương hiệu + MỘT màu nhấn + MỘT thang xám trung tính.
% Mọi sắc độ box đều DẪN XUẤT từ hai màu thương hiệu (không dùng màu tuỳ tiện
% như red/violet/magenta). Vùng màu tiết chế, để nội dung thở — cái làm một
% cuốn sách trông "đắt" là kỷ luật, không phải số lượng màu.
\RequirePackage{xcolor}
% Logo XeLaTeX (nếu gói metalogo không có thì dùng chữ thường, không vỡ build)
\IfFileExists{metalogo.sty}{\RequirePackage{metalogo}}{%
  \providecommand{\XeLaTeX}{X\kern-.15em\raisebox{-.3ex}{E}\kern-.15em\LaTeX}}
% -- Hai màu thương hiệu chính thức HCMUT (bộ nhận diện 04/2021, mục 1.1) --
\definecolor{HCMUTblue}{HTML}{032B91}   % xanh đậm — MÀU CHỦ, dùng cho cấu trúc
\definecolor{HCMUTazure}{HTML}{1488DB}  % xanh sáng — màu NHẤN, dùng dè
% CẢNH BÁO: bộ nhận diện tự mâu thuẫn ở màu chủ — ghi hex #030391 nhưng RGB
% 3,43,145 (=#032B91). CMYK 100-93-10-3 khớp bản RGB, nên dùng #032B91. Cần
% đối chiếu file gốc (.ai/.eps) với Phòng Truyền thông để chốt dứt điểm.
% -- Thang xám trung tính (chuẩn NXB: dùng xám thay cho màu ở đa số chỗ) --
\definecolor{MMink}{HTML}{1A1A1A}       % gần đen — chữ chính, không dùng đen tuyền
\definecolor{MMslate}{HTML}{54585A}     % xám đậm — chữ phụ, caption, số dòng
\definecolor{MMmist}{HTML}{6B7076}      % xám nhạt — ghi chú lề, chú thích
\definecolor{MMhair}{HTML}{D9DCE0}      % xám rất nhạt — đường kẻ mảnh, viền
\definecolor{MMpaper}{HTML}{F7F8FA}     % gần trắng ngả xanh — nền box trung tính
% -- Một sắc phụ DUY NHẤT cho cảnh báo, lấy tông đất trầm (không đỏ chói) --
\definecolor{MMalert}{HTML}{A6371F}     % nâu-đỏ trầm, kiểu MIT Press, dùng RẤT dè
% -- Hệ màu ngữ nghĩa: TẤT CẢ dẫn xuất từ thương hiệu + thang xám ----------
\colorlet{MMstruct}{HCMUTblue}          % cấu trúc: tiêu đề, khung định lý
\colorlet{MMaccent}{HCMUTazure}         % nhấn: liên kết, chi tiết cần chú ý
\colorlet{MMdef}{HCMUTblue}             % định nghĩa — dùng màu chủ, không blue thô
\colorlet{MMex}{MMslate}                % ví dụ — trung tính, không violet
\colorlet{MMwarn}{MMalert}              % chú ý — nâu-đỏ trầm, không red chói
\colorlet{MMobs}{HCMUTazure}            % quan sát — màu nhấn
\colorlet{HCMUTgrey}{MMslate}           % tương thích ngược với code cũ

% ---- hình học trang (giữ tỉ lệ của template gốc) -------------------------
\RequirePackage[a4paper,textwidth=6.3in,textheight=9.4in,
  marginparwidth=2.0cm,marginparsep=0.1cm,headsep=0.3in]{geometry}
\RequirePackage{marginnote}
\renewcommand*{\marginfont}{\tiny\itshape\color{HCMUTblue}}
% ---- GHI CHÚ LỀ HAI BÊN: tách hai LUỒNG ghi chú sang hai lề để KHÔNG chồng lấn.
% \marginnote mặc định -> lề NGOÀI (luồng "dụng ý thiết kế": \dysp/\dybt/\dylt/\dyng).
% \marginnoteL -> lề TRONG (đối diện; luồng "năng lực · nhận thức · rà soát":
% \btnl/\cdrtam/\nhanthuc/\canxet/\soatlai). Hai luồng luôn nằm ở hai lề đối nhau.
\newcommand{\marginnoteL}[1]{\begingroup\@reversemargintrue\marginnote{#1}\endgroup}
% \MMmarginalt: ghi chú lề LUÂN PHIÊN hai bên theo một số đếm DÙNG CHUNG. Mọi ghi
% chú đi qua đây thì hai ghi chú kề nhau trong nguồn luôn rơi vào hai lề đối nhau,
% nên không bao giờ chồng lấn dù đứng sát nhau. Dùng cho \btnl và \cdrtam — hai
% thiết bị hay đứng liền nhau ở cụm bài tập và ở đầu mục.
% (17/08/2026: trước đây \cdrtam ghim cứng lề TRONG nên nó đè lên đúng những ghi
% chú \btnl số chẵn cũng ở lề trong; đo được 12 lần đè trong bản nháp.)
\newcounter{MMbtnl}
\newcommand{\MMmarginalt}[1]{\stepcounter{MMbtnl}%
  \ifodd\value{MMbtnl}\marginnote{#1}\else\marginnoteL{#1}\fi}

% ---- gói nội dung --------------------------------------------------------
\RequirePackage{amsthm,amsmath}% amssymb/amscd bỏ: unicode-math đã cung cấp
\RequirePackage{makeidx}\makeindex
% Nhãn tham chiếu chéo của makeindex. Mặc định là "see", phải là "xem" cho bản Việt.
\AddToHook{begindocument/end}{%
  \renewcommand{\seename}{xem}\renewcommand{\alsoname}{xem thêm}}
% Đầu chỉ mục cần một câu nói rõ quy ước, nếu không thì người đọc gặp một dòng
% nghiêng không số trang mà không hiểu vì sao. Đặt trong đối số tùy chọn của
% \twocolumn, tức chạy hết chiều ngang ngay dưới tiêu đề, chứ KHÔNG đặt bằng
% \item[] bên trong danh sách vì nhãn rỗng in ra một cặp ngoặc vuông trơ.
\renewenvironment{theindex}
  {\if@twocolumn\@restonecolfalse\else\@restonecoltrue\fi
   \columnseprule\z@ \columnsep 35\p@
   \twocolumn[\@makeschapterhead{\indexname}%
     \begingroup\sffamily\small\color{MMslate}%
     \noindent Đầu mục là thuật ngữ tiếng Việt, kèm số trang nơi thuật ngữ được
     giới thiệu. Thuật ngữ tiếng Anh in \textit{nghiêng} và trỏ về đầu mục tiếng
     Việt tương ứng.\par\endgroup\vspace{12pt}]%
   \@mkboth{\indexname}{\indexname}%
   \thispagestyle{plain}\parindent\z@
   \parskip\z@ \@plus .3\p@\relax
   \let\item\@idxitem}
  {\if@restonecol\onecolumn\else\clearpage\fi}
% -- thuật ngữ: highlight lần đầu trong thân + đưa vào index cùng lúc ------
% \kn{thuật ngữ}          : in nhấn + \index{thuật ngữ}
% \kn[khoá index]{hiện}   : hiển thị khác khoá sắp xếp
% \knA{việt}{english}     : thuật ngữ Việt, kèm (english) in nghiêng, index cả hai
\newcommand{\kn}[2][]{%
  \def\@knkey{#1}\ifx\@knkey\@empty
    \textbf{#2}\index{#2}%
  \else
    \textbf{#2}\index{#1}\fi}
% CHỈ MỤC MỘT DÃY, TIẾNG VIỆT LÀM ĐẦU MỤC (chốt 01/09/2026, vòng 33).
% Trước đó \knA ghi HAI mục NGANG HÀNG, một Việt một Anh, nên chỉ mục trộn hai
% ngôn ngữ trong cùng một dãy A--Z mà không nói vì sao: "affine" nằm giữa "age
% structure" và "aggregation rule", còn "an toàn" nằm giữa "ambiguous grammar" và
% "anonymity". Tệ hơn, khi thuật ngữ Việt TRÙNG mặt chữ với tiếng Anh (2-SAT,
% 3-SAT, apply, BNF, tableau, affine) thì cùng một chữ in ra hai lần, một đứng một
% nghiêng, cùng số trang, đọc như lỗi bản in.
% Nay: mục tiếng Việt giữ số trang, mục tiếng Anh thành THAM CHIẾU CHÉO trỏ về mục
% Việt, và khi hai mặt chữ trùng nhau thì chỉ ghi MỘT mục (tham chiếu chéo trỏ về
% chính nó là vô nghĩa và makeindex sẽ in ra một dòng cụt).
% Đối số tùy chọn là KHÓA SẮP XẾP cho chỉ mục, dùng khi thuật ngữ đứng đầu câu nên
% phải viết hoa trong thân bài mà đầu mục chỉ mục thì phải viết thường; nếu không thì
% cùng một thuật ngữ ra hai đầu mục cạnh nhau, "Automat tích" và "automat tích".
\newcommand{\knA}[3][]{%
  \textbf{#2}\,(\textit{#3})%
  \def\MM@knkey{#1}\ifx\MM@knkey\@empty
    \index{#2}\else\index{#1@#2}\fi
  \begingroup
    \edef\MM@kna{\detokenize{#2}}\edef\MM@knb{\detokenize{#3}}%
    \ifx\MM@kna\MM@knb\else
      \ifx\MM@knkey\@empty
        \index{#3@\textit{#3}|see{#2}}%
      \else
        \index{#3@\textit{#3}|see{#1}}%
      \fi
    \fi
  \endgroup}
\RequirePackage{natbib}
\RequirePackage{multirow,multicol,longtable,array,booktabs,diagbox,tabularx}
% graphicx phải ở chế độ FINAL kể cả khi tài liệu bật [draft]: tùy chọn [draft]
% của lớp chỉ để tô xanh toán inline (\ifMMdraft), KHÔNG được biến hình thành
% khung rỗng. Nạp riêng với [final] rồi khóa lại Gin để mọi \includegraphics
% (kể cả hình PDF matplotlib ở Chương 9) luôn hiện ảnh thật ở bản nháp.
\PassOptionsToPackage{final}{graphicx}
\RequirePackage[final]{graphicx}
\setkeys{Gin}{draft=false}
\RequirePackage{float,wrapfig,caption,subcaption}
% Caption khác hẳn body: font sans nhỏ hơn, màu xám đậm, nhãn "Hình/Bảng" đậm
% màu brand -> hình/bảng đọc như một lớp riêng, không lẫn văn xuôi.
\captionsetup{font={sf,small,color=MMslate}, labelfont={sf,bf,color=HCMUTblue},
  labelsep=period, skip=6pt}
\captionsetup[sub]{font={sf,footnotesize,color=MMslate},
  labelfont={sf,bf,color=HCMUTblue}}
\RequirePackage{algorithm,algpseudocode}
\floatname{algorithm}{Thuật toán}% nhãn float tiếng Việt, khớp chỗ dẫn "Thuật toán~\ref"
\RequirePackage[framemethod=tikz]{mdframed}
\RequirePackage[many]{tcolorbox}
\RequirePackage{titlesec}
\RequirePackage{fancyhdr}
\RequirePackage{pgfplots}\pgfplotsset{compat=1.18}
\RequirePackage{tikz}
\usetikzlibrary{automata,positioning,arrows.meta,shapes.geometric,calc}
\RequirePackage{listings}
\IfFileExists{tracklang.sty}{\RequirePackage[acronym,nogroupskip]{glossaries}
  \def\MMglossariesok{1}}{\def\MMglossariesok{0}%
  % No-op cho \glsadd/\glsunset dùng trong THÂN chương (không được guard như
  % book.tex), để build không vỡ khi thiếu glossaries (vd runner CI).
  \newcommand{\glsadd}[2][]{}\newcommand{\glsunset}[1]{}%
  \ClassWarning{hcmut-textbook}{glossaries khong nap duoc (thieu tracklang) - glossary tam vo hieu}}
\RequirePackage[final,unicode,colorlinks=true,linktoc=all,
  citecolor=HCMUTblue,urlcolor=HCMUTblue,linkcolor=HCMUTblue]{hyperref}
% SIÊU DỮ LIỆU PDF. Không có khối này thì trường Title của tệp rỗng, và mọi trình đọc
% cùng mọi thư viện số sẽ hiển thị tên TỆP thay cho tên SÁCH. Đặt ở lớp tài liệu để cả
% ba bản (nháp, phát hành, giảng viên) mang cùng một siêu dữ liệu.
% pdflang giúp trình đọc màn hình phát âm đúng tiếng Việt.
\hypersetup{
  pdftitle    = {Mô hình hóa Toán học},
  pdfauthor   = {Nguyễn An Khương và nhóm biên soạn},
  pdfsubject  = {Giáo trình học phần CO2011, Khoa Khoa học và Kỹ thuật Máy tính,
                 Trường Đại học Bách khoa, Đại học Quốc gia Thành phố Hồ Chí Minh},
  pdfkeywords = {mô hình hóa toán học; lô-gic mệnh đề; lô-gic vị từ; kiểm chứng chương
                 trình; bộ ba Hoare; quy hoạch tuyến tính; quy hoạch nguyên; automat
                 hữu hạn; ngôn ngữ chính quy; mạng Petri; hệ động lực rời rạc; CO2011},
  pdflang     = {vi-VN},
  pdfcreator  = {LuaLaTeX},
  pdfdisplaydoctitle = true}
% URL DÀI PHẢI XUỐNG DÒNG ĐƯỢC. Mặc định `url` chỉ ngắt sau một số ký tự nhất định,
% nên một địa chỉ blog dài không có dấu chấm nào ở giữa sẽ tràn hẳn ra lề: đo được
% trên bản in Vòng 33f, mục tham khảo DeepMind 2025 tràn 311pt, tức tràn gần trọn một
% khổ chữ. Gói xurl cho phép ngắt ở MỌI ký tự trong url nên chữa dứt điểm cho cả các
% địa chỉ dài sẽ thêm về sau, thay vì đi vá từng mục một. Nạp SAU hyperref theo đúng
% yêu cầu của gói.
\RequirePackage{xurl}
% DOI trong mục tham khảo thành link clickable: gói doi biến \doi{...} (plainnat.bst
% xuất ra) thành \href tới https://doi.org/... (thay cho bản chữ thường của .bbl).
\RequirePackage{doi}
% cleveref: bỏ. Gói này không hỗ trợ tiếng Việt và xung đột với polyglossia.
% Thay bằng macro tham chiếu tiếng Việt tự định nghĩa (đọc tự nhiên hơn):
\newcommand{\chuong}[1]{Chương~\ref{#1}}
\newcommand{\muc}[1]{Mục~\ref{#1}}
\newcommand{\dinhly}[1]{Định lý~\ref{#1}}
\newcommand{\dinhnghia}[1]{Định nghĩa~\ref{#1}}
\newcommand{\vidu}[1]{Ví dụ~\ref{#1}}
\newcommand{\hinh}[1]{Hình~\ref{#1}}
\newcommand{\bang}[1]{Bảng~\ref{#1}}
\newcommand{\ptrinh}[1]{\eqref{#1}}
\newcommand{\baitap}[1]{Bài tập~\ref{#1}}
% Đánh số tới subsubsection, KHÔNG tới paragraph. Đặt 4 thì \paragraph cũng được
% đánh số, và mọi cấp trống in ra chữ số 0: đo được 20 tiêu đề mang số hiệu năm cấp
% kiểu "0.0.0.0.1" ở front matter và "3.9.2.0.1" trong thân sách. \paragraph ở sách
% này luôn là tiêu đề chạy trong dòng, thứ không cần số.
\setcounter{secnumdepth}{3}
\pgfplotsset{every axis/.append style={legend style={font=\scriptsize},
  tick label style={font=\scriptsize}}}

% ---- code (Python / PySAT / z3 / PuLP) ----------------------------------
% RENDER COMMENT TIẾNG VIỆT trong khối mã: dưới xelatex/lualatex, font mono
% TeX Gyre Cursor (đặt ở \setmonofont phía trên) PHỦ ĐỦ dấu tiếng Việt dựng sẵn
% (đã kiểm: ể, ầ, ỡ, ư, ơ, đ, ... đều có glyph). Nên KHÔNG dùng cách cũ `literate`
% của thời pdfLaTeX — cách đó vừa thiếu (chỉ ánh xạ 5 dấu) vừa BÓP MÉO chữ (ơ→ø
% Đan Mạch, ư→u mất móc, đ→d mất gạch). Thay vào đó bật `extendedchars` để mọi
% ký tự Unicode đi thẳng tới font mono Unicode, comment tiếng Việt hiện đúng.
% inputencoding=utf8 cho listings hiểu nguồn UTF-8 đa byte, không cắt vụn dấu.
\lstdefinestyle{MMpy}{language=Python,basicstyle=\small\ttfamily,
  keywordstyle=\color{HCMUTblue}\bfseries,commentstyle=\itshape\color{HCMUTgrey},
  stringstyle=\color{MMex},numbers=left,numberstyle=\tiny\color{HCMUTgrey},
  frame=leftline,framerule=1pt,rulecolor=\color{HCMUTazure},
  xleftmargin=1.2em,breaklines=true,showstringspaces=false,
  inputencoding=utf8,extendedchars=true,keepspaces=true}
\lstset{style=MMpy}

% ---- định lý: giữ nguyên tên và màu của template gốc --------------------
% ---- kiểu định lý: in nghiêng phần TÊN trong ngoặc (chuyên nghiệp hơn) ----
\newtheoremstyle{mmplain}{}{}{\itshape}{}{\bfseries}{.}{ }%
  {\thmname{#1}\thmnumber{ #2}\thmnote{ \normalfont\upshape(#3)}}
\newtheoremstyle{mmdef}{}{}{\upshape}{}{\bfseries}{.}{ }%
  {\thmname{#1}\thmnumber{ #2}\thmnote{ \normalfont\itshape(#3)}}
\theoremstyle{mmplain}
\newtheorem{theorem}{Định lý}[chapter]
\newtheorem{proposition}[theorem]{Mệnh đề}
\newtheorem{lemma}[theorem]{Bổ đề}
\newtheorem{corollary}[theorem]{Hệ quả}

\theoremstyle{mmdef}
\newtheorem{definition}{\textcolor{MMdef}{Định nghĩa}}[chapter]
\newtheorem{concept}{\textcolor{MMdef}{Khái niệm}}[chapter]
\newtheorem{condition}{Điều kiện}[chapter]
\newtheorem{example}{\textcolor{MMex}{\bfseries Ví dụ}}[chapter]
\newtheorem{exer}{Bài tập}[chapter]
\newtheorem{note}{\textcolor{MMex}{Ghi chú}}[chapter]
\newtheorem{fact}{\textcolor{MMdef}{\bfseries Tính chất}}[chapter]
\newtheorem{observation}{\textcolor{MMobs}{Nhận xét}}[chapter]

\theoremstyle{remark}
\newtheorem*{remark}{\textcolor{MMwarn}{\bfseries Chú ý}}
\newtheorem*{claim}{\textcolor{MMwarn}{\bfseries Khẳng định}}
\newtheorem*{quest}{\textcolor{MMwarn}{\bfseries Câu hỏi}}
\newtheorem*{problem}{\textcolor{MMdef}{Bài toán}}
\newtheorem*{quiz}{\textcolor{MMex}{\bfseries Thực hành}}
\newtheorem*{phanbiet}{\textcolor{MMdef}{\bfseries Lưu ý về thuật ngữ}}
\newtheorem*{luuykh}{\textcolor{MMwarn}{\bfseries Lưu ý về kí hiệu}}
\newtheorem*{luukh}{\textcolor{MMwarn}{\bfseries Lưu ý về kí hiệu}}% alias
\newtheorem*{baitoanmo}{\textcolor{MMwarn}{\bfseries Bài toán mở}}
\newtheorem*{convention}{\textcolor{MMdef}{\bfseries Quy ước}}
\newtheorem*{summary}{\textcolor{MMobs}{\bfseries Tóm tắt}}
\newtheorem*{concepts}{\textcolor{MMdef}{\bfseries Các khái niệm cơ bản}}
\newtheorem*{method}{\textcolor{MMex}{Phương pháp}}
\newtheorem*{solution}{\textcolor{MMdef}{\bfseries Lời giải}}
\newtheorem*{hint}{\textcolor{MMslate}{\bfseries Gợi ý}}
\newtheorem*{notation}{\textcolor{MMdef}{\bfseries Ký hiệu}}
% kbox: khối kết chương "Kết quả cần ghi nhớ". Tiêu đề ĐỨNG RIÊNG một dòng, có
% khoảng thở, không dính vào gạch đầu dòng đầu tiên (khác newtheorem in-line).
\newtcolorbox{kbox}{mmquiet,title={Kết quả cần ghi nhớ},
  fonttitle=\sffamily\bfseries\color{MMex}, before skip=10pt, after skip=10pt}

\numberwithin{equation}{chapter}
\numberwithin{figure}{chapter}
\numberwithin{table}{chapter}

\providecommand{\blacksquare}{\ensuremath{\mathord{\vrule width .55em height .55em depth 0pt}}}
% ---- DẤU KẾT MÔI TRƯỜNG, theo chuẩn quốc tế (rà lại 01/09/2026) ------------
% NGHIÊN CỨU. Dấu kết chứng minh là "tombstone", còn gọi là dấu Halmos, do Paul
% Halmos đưa vào toán học năm 1950, mượn từ dấu kết bài của tạp chí; hình của nó là
% một hình vuông ĐẶC hoặc RỖNG (Wikipedia, "Tombstone (typography)"). Trong amsthm
% của Hội Toán học Mỹ, dấu này được tự động thêm vào CHỈ ở môi trường proof; ba kiểu
% định lý plain, definition và remark KHÔNG có dấu kết nào (amsthm user's guide).
% Không nhà xuất bản toán nào dùng MÀU để phân loại dấu kết: phân biệt luôn bằng
% HÌNH DẠNG, còn màu thì theo màu chữ.
% QUYẾT ĐỊNH. Bỏ bảng sáu màu dùng từ trước, vì nó là trang trí chứ không phải quy
% ước, và ở bản in đen trắng thì sáu màu về cùng một sắc xám. Nay chỉ còn hai hình:
%   ■ ĐẶC  — chỉ dành cho môi trường proof, đúng nghĩa QED.
%   □ RỖNG — kết mọi môi trường khác (ví dụ, định nghĩa, tính chất, nhận xét, và
%             định lý chỉ phát biểu không kèm chứng minh).
% Vì sao vẫn giữ dấu kết cho các môi trường ngoài proof, dù amsthm không có: kiểu
% mmdef và remark của sách dùng THÂN CHỮ ĐỨNG, nên khi hết môi trường không có tín
% hiệu thị giác nào; kiểu mmplain dùng thân nghiêng nên tự nó đã kết, và dấu ở đó
% chỉ là bổ trợ. Mọi lệnh \EndXXX cũ giữ nguyên tên để 240 chỗ gọi trong thân sách
% không phải sửa; chúng chỉ đổi cái mà chúng in ra.
\definecolor{QEDink}{HTML}{1A1A1A}  % bằng đúng màu chữ chính (MMink)
\definecolor{MMteal}{HTML}{0B7A75}  % xanh ngọc, dùng cho nhãn nhánh mở ở cây ngữ nghĩa
\providecommand{\square}{\ensuremath{\mathord{\vcenter{\hbox{%
  \vrule width .5pt height .52em depth 0pt \kern-.5pt
  \vbox{\hrule height .5pt width .52em \kern .52em \hrule height .5pt}%
  \kern-.5pt \vrule width .5pt height .52em depth 0pt}}}}}
\renewcommand{\qedsymbol}{\textcolor{QEDink}{$\blacksquare$}}% CHỈ môi trường proof
% Dấu kết chung cho mọi môi trường không phải chứng minh.
\newcommand{\MMketmoitruong}{\hfill\textcolor{QEDink}{$\square$}}
\newcommand{\Endexample}{\MMketmoitruong}
\newcommand{\Endtheorem}{\MMketmoitruong}
\newcommand{\Enddinhnghia}{\MMketmoitruong}
\newcommand{\Endtinhchat}{\MMketmoitruong}
\newcommand{\Endnhanxet}{\MMketmoitruong}
% Biến thể "here": dùng khi DÒNG CUỐI của môi trường là công thức hiển thị, để dấu
% nằm cuối dòng công thức thay vì rớt xuống dòng mới (amsthm cho \qedhere ở proof).
\newcommand{\MMkethere}{\tag*{\textcolor{QEDink}{$\square$}}}
\newcommand{\Endexhere}{\MMkethere}
\newcommand{\Endthmhere}{\MMkethere}
\newcommand{\Enddefhere}{\MMkethere}
\newcommand{\Endfacthere}{\MMkethere}
\newcommand{\Endrmkhere}{\MMkethere}

% ---- KIỂU BOX NỀN, chuẩn NXB (MIT Press): thanh màu bên trái, viền mảnh, --
% ---- nền cực nhạt, không khung nặng. Mọi box kế thừa từ đây để nhất quán. --
% Sửa MỘT chỗ này là toàn bộ box đổi theo — đúng kỷ luật thiết kế hệ thống.
\tcbset{
  mmbase/.style={
    enhanced, breakable,
    boxrule=0pt, frame hidden,
    borderline west={2.2pt}{0pt}{MMstruct},  % thanh nhấn bên trái
    colback=MMpaper,                          % nền gần trắng ngả xanh
    coltitle=MMstruct, fonttitle=\bfseries\sffamily,
    left=3mm, right=3mm, top=1.6mm, bottom=1.6mm,
    boxsep=1mm, sharp corners,
    before skip=8pt, after skip=8pt,
    detach title, before upper={\tcbtitle\par\smallskip}
  },
  mmquiet/.style={mmbase, colback=white,
    borderline west={2.2pt}{0pt}{MMmist}, coltitle=MMslate},
  mmaccent/.style={mmbase,
    borderline west={2.2pt}{0pt}{MMaccent}, coltitle=MMaccent},
  mmalert/.style={mmbase, colback=MMalert!4,
    borderline west={2.2pt}{0pt}{MMalert}, coltitle=MMalert},
}

% ---- ba môi trường sư phạm cốt lõi (Dunlosky 2013) ---------------------
\newtcolorbox{tukiemtra}[1][]{mmaccent,title={Tự kiểm tra},#1}
\newtcolorbox{onlai}[1][]{mmaccent,title={Ôn lại (giãn cách)},#1}
% hộp luồng xuyên suốt. Tham số bắt buộc là TÊN LUỒNG. (đổi tên từ `iap`
% ngày 24/07/2026: đặt tên môi trường theo một bài toán là tự khoá sách vào nó.)
\newtcolorbox{xuyensuot}[2][]{mmbase,title={Luồng xuyên suốt · #2},#1}
% hộp "đường ra": nối nội dung với sân chơi ngoài lớp.
% CẢNH BÁO BẢO TRÌ: hộp có mốc thời gian phải soát mỗi năm — dùng \soatlai{}.
\newtcolorbox{duongra}[2][]{mmbase,title={Đường ra · #2},#1}
% CỔNG NHÁP (vá 17/08/2026): \soatlai là ghi chú BẢO TRÌ cho người biên tập, không
% phải cho người học. Trước bản vá này nó thiếu \ifMMdraft nên in thẳng ra bản
% release phát cho sinh viên (đã chứng minh bằng biên dịch lualatex + pdftotext).
\newcommand{\soatlai}[1]{\ifMMdraft\marginnoteL{\textbf{Soát lại:} #1}\fi}

% ---- môi trường phục vụ người đọc thế hệ mới -----------------------------
% Lịch sử và chân dung: tông trung tính (xám), để không tranh màu với cấu trúc.
\newtcolorbox{lichsu}[1][]{mmquiet,title={Ghi chú lịch sử},#1}
\newtcolorbox{chandung}[2][]{mmquiet,title={Chân dung · #2},#1}
\newtcolorbox{lienganh}[1][]{mmaccent,title={Ứng dụng tiêu biểu},#1}
% Bắc nhịp: nối khái niệm ĐH với thứ sinh viên đã thạo ở phổ thông / toán năm
% nhất (giải tích, đại số tuyến tính, xác suất, thống kê). Gỡ nỗi sợ bằng cách
% chỉ ra "bạn đã làm điều này rồi, dưới một cái tên khác". Tông trung tính,
% ấm — không phải cảnh báo, mà là bàn tay đỡ.
\newtcolorbox{bacnhip}[1][]{mmquiet,title={Liên hệ lại với những điều đã quen thuộc},#1}
% Khoảnh khắc bất ngờ: điểm nhấn mạnh nhất — dùng màu chủ đậm để nổi.
\newtcolorbox{batngo}[1][]{mmbase,title={Nhìn vào bản chất},#1}
% Thực hành ngay: mã tối thiểu để thấy khái niệm hoạt động. KHÔNG dạy API thư viện.
\newtcolorbox{chayngay}[1][]{mmaccent,title={Thực hành ngay},#1}
% Hộp về công cụ AI: AI trả lời thế nào, và chỗ nào bạn phải tự phán quyết.
\newtcolorbox{hoiai}[1][]{mmalert,title={Nếu bạn hỏi AI},#1}
% Bạn đang ở đâu: bản đồ bốn hình thức hoá, đặt đầu mỗi chương.
\newcommand{\banddo}[1]{\par\smallskip
  {\footnotesize\sffamily\color{HCMUTblue}\textbf{Bạn đang ở đâu:} #1\par}\smallskip}
% Chuẩn đầu ra tạm của chương, chờ thống nhất khi soạn lại đề cương.
% CỔNG NHÁP (vá 17/08/2026): nhãn tự khai là "(tạm)" và ở ch05 còn mang mã chỗ
% trống L.O.2.x, nên nó là thiết bị NHÁP; trước bản vá này nó thiếu \ifMMdraft và
% in thẳng ra bản release (đã chứng minh bằng biên dịch lualatex + pdftotext).
% Đồng thời chuyển sang luồng lề LUÂN PHIÊN \MMmarginalt (xem chú thích ở dòng 112)
% để hết đè lên ghi chú \btnl ở lề trong.
\newcommand{\cdrtam}[1]{\ifMMdraft\MMmarginalt{\textbf{CĐR (tạm):} #1}\fi}

% ---- cụm câu hỏi trắc nghiệm SIÊU KHÓ, không đáp án (thử thách) -----------
% Mục đích: cho sinh viên hình dung mức độ câu MCQ khó nhất trong đề thi thật,
% và một bức tường để tự thử sức. KHÔNG in đáp án trong bản sinh viên.
% Đáp án + lời giải sống trong content/chNN/mcq-hard.yaml (bản giảng viên),
% do D1/D7 kiểm và CI chấm — không phá quy tắc "mọi câu phải kiểm được" ở tài
% liệu 13. Cờ \ifshowkeys bật ở bản giảng viên, tắt ở bản sinh viên.
\newif\ifshowkeys \showkeysfalse   % mặc định: bản sinh viên, KHÔNG hiện key
\newcounter{tthcau}
% Neo hyperref phải DUY NHẤT toàn tài liệu. \thuthachreset đặt lại tthcau về 0 ở mỗi
% cụm, nên bốn cụm (Ch.4, Ch.6, Ch.7, Ch.9) cùng sinh đích 'tthcau.1', 'tthcau.2'…
% Bản in 30/08 nuốt 14 đích trùng: mọi liên kết tới câu của Ch.7 hay Ch.9 nhảy về
% câu cùng số của Ch.4, mà trang in thì không lộ gì. Chỉ đổi TÊN NEO, số in ra vẫn
% do \arabic{tthcau} quyết nên không đổi một ký tự nào trên trang.
\providecommand{\theHtthcau}{}
\renewcommand{\theHtthcau}{\thechapter.\arabic{tthcau}}
\newtcolorbox{thuthach}[1][]{mmalert,
  title={Thử thách trắc nghiệm},#1}
\newcommand{\thuthachreset}{\setcounter{tthcau}{0}}
\newcommand{\cauhoi}[1]{\par\refstepcounter{tthcau}%
  \smallskip\noindent\textbf{\arabic{tthcau}.}~#1\par\nopagebreak\smallskip}
% -- Phương án trắc nghiệm trên LƯỚI CỘT ĐỀU (gói tasks) ------------------
% Chuẩn NXB: phương án căn thành cột đều, tự wrap trong ô, không trôi lệch.
% \pa{...} — mỗi phương án; tasks tự đánh nhãn (A)(B)(C)(D).
% Môi trường `phuongan` = 2 cột (mặc định); `phuongan4` = 4 cột cho phương án ngắn.
\RequirePackage{tasks}
% item-indent phải >= label-width để nhãn (A)(B) nằm TRONG lề, không tràn ra
% ngoài mép trái (nhất là khi cụm nằm trong hộp tcolorbox có lề riêng).
\settasks{label={(\Alph*)},label-width=2.4em,label-offset=0.4em,
  item-indent=2.8em,column-sep=1.4em,after-item-skip=2pt,label-align=left}
\NewTasksEnvironment[label={(\Alph*)}]{phuongan}[\pa](2)
\NewTasksEnvironment[label={(\Alph*)}]{phuongan4}[\pa](4)
\NewTasksEnvironment[label={(\Alph*)}]{phuongan1}[\pa](1)
% bọc để chữ nhỏ và không tách trang giữa cụm phương án
\let\MMphuonganorig\phuongan \let\endMMphuonganorig\endphuongan
% Khối chỉ hiện ở bản giảng viên
\newcommand{\dapan}[1]{\ifshowkeys\par{\footnotesize\color{HCMUTblue}%
  \textbf{Đáp án \& lời giải (bản GV):} #1}\par\fi}

% ---- trích dẫn có định vị chính xác --------------------------------------
% Quy tắc: KHÔNG BAO GIỜ dẫn nguồn ở mức cả cuốn sách. Mọi định nghĩa, định lý,
% ví dụ và số liệu lấy từ nguồn phải kèm ĐỊNH VỊ NỘI BỘ của nguồn (số định lý,
% số mục, số bài tập) — thứ này bền qua mọi lần in — và số trang kèm theo cho
% tiện tra. Bản in được ghim chính xác trong bib/co2011.bib.
%
% Bốn quan hệ tham khảo, phân biệt rõ để không nhập nhằng:
%   \theo      — trình bày cùng kết quả, lời văn và chứng minh của chúng tôi
%   \phongtheo — đổi bối cảnh hoặc dữ liệu so với nguồn
%   \dan       — dẫn nguyên văn, TỐI ĐA 15 từ, bắt buộc trong ngoặc kép
%   \sovoi     — có liên quan nhưng không dùng làm cơ sở
\newcommand{\nguon}[2]{\citep[#2]{#1}}
\newcommand{\theo}[2]{(xem \citet{#1}\ifx\relax#2\relax\else, #2\fi)}
\newcommand{\phongtheo}[2]{(xem \citet{#1}\ifx\relax#2\relax\else, #2\fi)}
\newcommand{\dan}[3]{``#3''~\citep[#2]{#1}}
\newcommand{\sovoi}[2]{\emph{so với} \citet{#1}, #2}
% Biến thể VIẾT HOA cho vị trí đầu câu/đầu đoạn (tránh chữ thường mở câu)
\newcommand{\Theo}[2]{\emph{Theo} \citet{#1}, #2}
\newcommand{\Phongtheo}[2]{\emph{Phỏng theo} \citet{#1}, #2}
\newcommand{\Sovoi}[2]{\emph{So với} \citet{#1}, #2}
% Định vị chưa kiểm được (PDF ảnh chưa OCR): bắt buộc gắn cờ, D3 chặn ở G3.
% Dấu "[chưa kiểm định vị]" CHỈ hiện ở bản nháp; nội dung #1 luôn hiện. Nguồn
% grep vẫn thấy \chuakiem nên cổng QA G3 không bị mù.
\newcommand{\chuakiem}[1]{#1\ifMMdraft\,\textsuperscript{[chưa kiểm định vị]}\fi}

% dấu vết tham khảo cuối mục — nay yêu cầu định vị, không nhận tên sách trơn.
% CHỐT 24/07/2026: IN trong cả bản dành cho sinh viên. Tốn khoảng 10 trang trên
% toàn sách, đổi lấy việc dạy sinh viên thói quen truy nguồn — đúng năng lực môn
% này muốn xây. Xem qa/style-sheet.yaml: build.print_provenance_in_student_edition
%
% Placeholder AN TOÀN CHO BẢN RELEASE: nội dung chưa điền chỉ hiện ở chế độ
% [draft] để nhắc người soạn; ở bản phát hành nó TỰ ẨN, không bao giờ in ra
% "chưa điền" hay "TODO" trong sách sinh viên đọc. \chuadien{gợi ý} dùng cho
% mọi chỗ tạm (tên nhân vật, tiêu đề, v.v.).
\newcommand{\chuadien}[1]{\ifMMdraft
  \textcolor{MMalert}{\normalfont\sffamily\scriptsize[cần điền: #1]}\fi}
% \provenance{...} in nguồn thật. Khi chưa có nguồn, DÙNG \provenancetodo (không
% tham số) — nó tự ẩn ở release, chỉ nhắc ở nháp. Tách hai lệnh để tránh so sánh
% chuỗi mong manh.
% QUYẾT ĐỊNH 17/08/2026 — \provenance CỐ Ý KHÔNG có cổng \ifMMdraft: nhà đã chốt in
% nó ra bản sinh viên (qa/style-sheet.yaml: print_provenance_in_student_edition).
% Ta GIỮ nguyên hành vi này. Hệ quả phải nhớ: mọi thứ đặt trong \provenance là VĂN
% BẢN IN CHO SINH VIÊN, nên KHÔNG được đặt mã chỗ trống (L.O.N.x), "TODO", hay ghi
% chú biên tập vào đây — phần treo phải dời sang \canxet (có cổng) hoặc
% \provenancetodo. Bất biến này được canh bằng máy ở qa/check_release_pdf.py
% (quét bản text của PDF release) và qa/check_style.py (quét nguồn).
\newcommand{\provenance}[1]{\par\smallskip
  {\footnotesize\itshape\color{HCMUTgrey}Nguồn của mục này: #1\par}}
\newcommand{\provenancetodo}{\ifMMdraft\par\smallskip
  {\footnotesize\itshape\color{MMalert}[provenance cần điền]\par}\fi}

% ---- ký hiệu tách bạch: nghiệm tối ưu vs điểm cân bằng ------------------
% Quyết định 24/07/2026: x* giữ nguyên nghĩa "nghiệm tối ưu" theo quy ước LP
% phổ quát (Matoušek, Vanderbei, Nemhauser). Điểm cân bằng của hệ động lực
% dùng ký hiệu riêng. Định nghĩa qua macro để đổi toàn cục ở một chỗ.
\newcommand{\optsol}[1]{#1^{*}}              % nghiệm tối ưu
\newcommand{\eqpt}[1]{#1^{\mathrm{eq}}}      % điểm cân bằng
\newcommand{\marking}[1]{M_{#1}}             % marking của mạng Petri
\newcommand{\incid}{\mathbf{C}}              % ma trận liên thuộc (incidence)
\newcommand{\firing}[1]{\mathbf{u}_{#1}}     % vector kích hoạt

% ---- motif lưới lục giác của bộ nhận diện --------------------------------
% Bộ nhận diện mục 1.2: motif mắt lưới tam giác kết thành hình lục giác, đồng
% nhất với logo. Vẽ bằng TikZ để tái tạo được và không phụ thuộc ảnh bitmap.
% Dùng làm hoa văn nhạt ở trang bìa và trang mở chương, đã làm mờ để không
% ảnh hưởng văn bản (yêu cầu của bộ nhận diện).
\newcommand{\hcmutmotif}[1][0.10]{%
  \begin{tikzpicture}[opacity=#1,line width=0.35pt,draw=HCMUTazure]
    \foreach \i in {0,...,7}{\foreach \j in {0,...,4}{
      \begin{scope}[shift={({\i*1.732cm + mod(\j,2)*0.866cm},{\j*1.5cm})}]
        \draw (0:1cm) \foreach \a in {60,120,...,300}{ -- (\a:1cm)} -- cycle;
        \foreach \a in {0,60,...,300}{\draw (0,0) -- (\a:1cm);}
      \end{scope}}}
  \end{tikzpicture}}
% biến thể vẽ TRẮNG, dùng trên nền tối (bìa màu chủ)
\newcommand{\hcmutmotifw}[1][0.10]{%
  \begin{tikzpicture}[opacity=#1,line width=0.35pt,draw=white]
    \foreach \i in {0,...,7}{\foreach \j in {0,...,4}{
      \begin{scope}[shift={({\i*1.732cm + mod(\j,2)*0.866cm},{\j*1.5cm})}]
        \draw (0:1cm) \foreach \a in {60,120,...,300}{ -- (\a:1cm)} -- cycle;
        \foreach \a in {0,60,...,300}{\draw (0,0) -- (\a:1cm);}
      \end{scope}}}
  \end{tikzpicture}}

% ---- trang, header, footer (giữ dáng template gốc) ---------------------
% ---- ĐẦU CHƯƠNG, chuẩn NXB (MIT Press): số chương khổ lớn làm điểm neo ---
% thị giác, tiêu đề đặt dưới, một thanh màu chủ mảnh phân tách. Tiết chế.
\titleformat{\chapter}[display]
  {\normalfont\sffamily}
  {\filleft\fontsize{64}{64}\selectfont\bfseries\color{MMaccent}\thechapter}
  {0.4ex}
  {\filleft\Huge\bfseries\color{MMstruct}}
  [\vspace{0.8ex}{\color{MMstruct}\titlerule[2pt]}\vspace*{0.5ex}%
   {\color{MMhair}\titlerule[0.4pt]}]
\titlespacing*{\chapter}{0pt}{10pt}{28pt}
% Mục: chữ sans màu chủ, khoảng thở rộng. Dùng \normalfont trong nhãn số để
% tránh xung đột khi tiêu đề chứa ký hiệu toán unicode-math (ε, ⊢, ...).
\titleformat{\section}
  {\normalfont\Large\sffamily\bfseries\color{MMstruct}}
  {\color{MMaccent}\thesection}{0.8em}{}
\titleformat{\subsection}
  {\normalfont\large\sffamily\bfseries\color{MMslate}}
  {\color{MMaccent}\thesubsection}{0.6em}{}
\titlespacing*{\section}{0pt}{2.6ex plus 1ex minus .2ex}{1.2ex plus .2ex}

\setlength{\headheight}{15.2pt}
\pagestyle{fancy}\fancyhf{}
\renewcommand{\headrulewidth}{0.1pt}
% Chân trang để TRỐNG, nên không kẻ đường chân trang: đáy trang thuộc về khối chú thích.
\renewcommand{\footrulewidth}{0pt}
\renewcommand{\chaptermark}[1]{\markboth{{\bfseries Chương~\thechapter.} #1}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection.\ #1}}
\fancyhead[LE]{\footnotesize\nouppercase\rightmark}
\fancyhead[RO]{\footnotesize\nouppercase\leftmark}
\fancyhead[LO,RE]{\footnotesize\thepage}
% KHÔNG đặt chân trang. Tên sách lặp ở mọi trang không thêm thông tin, mà lại chen ngay
% dưới khối chú thích nên đáy trang chật. Số trang nằm ở đầu trang, xem \fancyhead ở trên.

\newcommand*{\blankpage}{{\vspace*{\fill}\centering
  {\footnotesize\itshape Trang này được cố tình để trống.}\vspace{\fill}}}
\makeatletter
\renewcommand*{\cleardoublepage}{\clearpage\if@twoside\ifodd\c@page\else
  \blankpage\thispagestyle{empty}\newpage
  \if@twocolumn\hbox{}\newpage\fi\fi\fi}
\makeatother

% ---- chế độ draft: toán inline tô xanh để soát bài ---------------------
% everymath luôn được đặt (kể cả release) để ký hiệu unicode-math trong tiêu đề
% sans-bold không vỡ; release để màu mực thường, draft tô xanh để soát.
\ifMMdraft
  \everymath{\color{MMdef}}
  \RequirePackage{draftwatermark}
  \SetWatermarkText{BAN NHAP}\SetWatermarkScale{1.1}
  \SetWatermarkColor{HCMUTgrey!12}
\else
  \everymath{\color{MMink}}
\fi

\parindent2ex
\setlength{\parskip}{4pt}
\def\baselinestretch{1.02}
\floatplacement{figure}{H}\floatplacement{table}{H}
% ---- mức nhận thức Bloom + năng lực MIT (hiện ở nháp, ẩn ở bản in) ----
% \nhanthuc{<bậc Bloom VN>}{<mức MIT 1..5>}
\newcommand{\nhanthuc}[2]{\ifMMdraft\marginnoteL{\tiny\itshape Nhận thức: #1 · MIT #2}\fi}

% ---- CỜ CẦN CHỦ BIÊN XÉT: ghi chú lề MÀU ĐỎ, chỉ hiện ở bản nháp, ẩn sạch ở bản in.
% Dùng cho MỌI điểm agent/biên tập viên không chắc, cần chủ biên quyết (nghi bịa,
% mâu thuẫn, thiếu nguồn, thuật ngữ chờ chốt...). Chủ biên đọc bản nháp là thấy ngay
% tận chỗ để xử lý. KHÔNG bao giờ lọt vào bản release.
\definecolor{MMflag}{HTML}{CC0000}
\newcommand{\canxet}[1]{\ifMMdraft\marginnoteL{\scriptsize\color{MMflag}\textbf{[!\,CẦN XÉT]}~#1}\fi}

% ---- GHI CHÚ DỤNG Ý THIẾT KẾ (design-intent margin notes) --------------------
% Bộ ghi chú lề MÃ MÀU cho chủ biên + đồng tác giả/người rà soát ĐỌC ĐƯỢC DỤNG Ý
% (vì sao chọn cách này). Chỉ hiện ở bản nháp [draft], ẩn sạch ở release như \canxet.
% NGẮN GỌN SÚC TÍCH (một cụm), đặt THƯA để tránh chồng lấn; mỗi loại một màu riêng:
%   \dysp = Dụng ý SƯ PHẠM (vì sao dạy thế này) — xanh ngọc
%   \dybt = Dụng ý BIÊN TẬP (quyết định trình bày/thuật ngữ/cắt gọt) — tím
%   \dylt = LIÊN THÔNG (nối chương/khái niệm khác) — cam hổ phách
%   \dyng = CĂN CỨ / NGUỒN (khung theo tài liệu nào, vì sao) — chàm
\definecolor{DYsp}{HTML}{0B7A75}   % xanh ngọc  — sư phạm
\definecolor{DYbt}{HTML}{6A2C91}   % tím        — biên tập
\definecolor{DYlt}{HTML}{B5651D}   % cam hổ phách — liên thông
\definecolor{DYng}{HTML}{2E5A88}   % chàm       — căn cứ/nguồn
\newcommand{\dysp}[1]{\ifMMdraft\marginnote{\tiny\color{DYsp}\textbf{[SP]}~#1}\fi}
\newcommand{\dybt}[1]{\ifMMdraft\marginnote{\tiny\color{DYbt}\textbf{[BT]}~#1}\fi}
\newcommand{\dylt}[1]{\ifMMdraft\marginnote{\tiny\color{DYlt}\textbf{[LT]}~#1}\fi}
\newcommand{\dyng}[1]{\ifMMdraft\marginnote{\tiny\color{DYng}\textbf{[NG]}~#1}\fi}

% ---- BÀI TẬP/DỰ ÁN: ghi chú lề MỤC TIÊU NĂNG LỰC + Ý ĐỒ SƯ PHẠM (draft-only) ---
% Mỗi bài tập/dự án kèm một ghi chú lề justify: nhắm năng lực/CĐR nào, và vì sao ra
% đề thế này (ý đồ sư phạm). \btnl{<năng lực, vd "Vận dụng · L.O.1.2">}{<ý đồ ngắn>}
% Vì cụm bài một-dòng liền nhau làm ghi chú \btnl xếp sát nhau, ta cho chúng LUÂN
% PHIÊN hai lề (bài lẻ ra lề ngoài, bài chẵn ra lề trong): hai bài kề nhau LUÔN nằm
% ở hai lề đối nhau nên không bao giờ chồng lấn. Từ 17/08/2026 phép luân phiên dùng
% chung \MMmarginalt với \cdrtam (số đếm MMbtnl khai báo cùng \MMmarginalt, dòng 112),
% nên một \cdrtam chen giữa hai bài cũng không đè lên bài nào.
\newcommand{\btnl}[2]{\ifMMdraft
  \MMmarginalt{\tiny\color{DYsp}\textbf{[BT·MT]}~#1. \textit{#2}}\fi}

% ---- LỜI GIẢI \& GHI CHÚ GIẢNG DẠY cho GIẢNG VIÊN — CHỈ hiện ở bản [solution] ---
% Sổ tay giảng viên (Instructor Manual) nhúng inline: lời giải đã kiểm + gợi ý dạy
% (lỗi thường gặp, điểm chốt, liên hệ CĐR, thời lượng). KHÔNG phát hành cho sinh
% viên: ở bản thường/nháp, môi trường bị nuốt sạch (comment) nên không rò một chữ.
\RequirePackage{comment}
\ifMMsolution
  \definecolor{GVteal}{HTML}{0B7A75}
  \newtcolorbox{gvgiai}[1][]{mmquiet, breakable, colframe=GVteal, coltitle=GVteal,
    title={Lời giải \& ghi chú giảng dạy \textnormal{\small(bản GIẢNG VIÊN — không phát hành)}}, #1}
\else
  \excludecomment{gvgiai}
\fi
% ---- GHI CHÚ THUẬT NGỮ: footnote cho một thuật ngữ Việt dễ gây tranh cãi.
% Nêu: dịch từ đâu (Anh), bẫy khi đọc chữ theo nghĩa đen, nghĩa thật, và vì sao
% chọn thuật ngữ Việt này. VD: \gtn{``Giá bóng'' dịch shadow price. Đừng để chữ
% ``bóng'' đánh lừa: đây không phải giá thị trường mà là giá trị kinh tế ngầm...}
\newcommand{\gtn}[1]{\footnote{\textit{Ghi chú thuật ngữ.}~#1}}

% ---- CỘT SỐ TRANG TRONG MỤC LỤC / DANH MỤC HÌNH / DANH MỤC BẢNG.
% Mặc định LaTeX dành \@pnumwidth = 1.55em cho số trang. Front matter của sách
% đánh số La Mã, và tới ``xxxix''/``xl'' thì số trang rộng hơn ô này, nên MỖI dòng
% mục lục sinh một Overfull \hbox 1.29pt — 292 trên tổng 301 cảnh báo tràn lề của
% bản release đều từ đúng nguyên nhân này, và chúng che mất mấy chỗ tràn thật.
% Nới ô số trang (và lề phải tương ứng) là cách chữa tận gốc, không ảnh hưởng
% thân bài. Xem báo cáo audit Vòng 29, trục G.
% Lưu ý: lớp đã gọi \makeatother ở dòng 499, nên ở đây phải mở lại \makeatletter,
% nếu không \@pnumwidth bị đọc thành \@ cộng chữ ``pnumwidth'' và trình biên dịch
% báo ``Missing \begin{document}''.
% CẬP NHẬT 01/09/2026: 2,2em vẫn còn hụt. Đo trên bản phát hành, ba mục Danh sách
% hình và Danh sách bảng trỏ vào front matter còn tràn: ``xxxvi'' tràn 2,88pt,
% ``xxxvii'' tràn 6,33pt, ``xxxix'' tràn 2,88pt. Một em ở cỡ 10,95pt là 10,95pt, nên
% muốn nuốt trọn 6,33pt phải nới thêm ít nhất 0,58em. Lấy 3,0em cho có biên an toàn.
% ĐỪNG thêm một khối \@pnumwidth thứ hai ở chỗ khác trong tệp này: khối nào đứng SAU
% sẽ ghi đè khối trước, và đó đúng là lỗi đã mắc một lần trong Vòng 33.
\makeatletter
\renewcommand{\@pnumwidth}{3.0em}
\renewcommand{\@tocrmarg}{3.9em}
\makeatother

\endinput
