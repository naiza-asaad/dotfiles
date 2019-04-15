set nocompatible              " be iMproved, required
"filetype off
filetype plugin on

" set the runtime path to include Vundle and initialize
set rtp+=~/vimfiles/bundle/Vundle.vim/
let path='~/vimfiles/bundle'
call vundle#begin(path)
" alternatively, pass a path where Vundle should install plugins
"all vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.

Plugin 'Raimondi/delimitMate'
Plugin 'vimwiki/vimwiki'
Plugin 'wesQ3/vim-windowswap'
Plugin 'mattn/emmet-vim'
Plugin 'itchyny/lightline.vim' "enable if you get tired of airline's slowness
Plugin 'moll/vim-bbye'
Plugin 'Lenovsky/nuake.git'
Plugin 'ap/vim-css-color'
Plugin 'neoclide/vim-jsx-improve' "JS syntax from vim-javascript and JSX highlighting and indentation by vim-jsx-pretty
Plugin 'elzr/vim-json'
Plugin 'morhetz/gruvbox'
Plugin 'w0rp/ale'
Plugin 'Yggdroot/indentLine'
Plugin 'tomtom/tcomment_vim'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-buftabline'
Plugin 'itchyny/vim-gitbranch' "returns names of branch; add it to lightline
Plugin 'vim-cursorword'
Plugin 'dart-lang/dart-vim-plugin'
Plugin 'bitc/vim-bad-whitespace'
Plugin 'tpope/vim-surround'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'mbbill/undotree'
"Plugin 'thosakwe/vim-flutter' "can't get this to work :(
"Plugin 'neoclide/coc.nvim'
Plugin 'artur-shaik/vim-javacomplete2'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

"======================================================================================
"UI CONFIG
"======================================================================================
syntax on 
set number
set rnu "relative line numbers

syntax enable
set encoding=utf-8

set autoindent

set wrap! "Don't wrap around
"set tw=80 "Allow wrap

colorscheme gruvbox 
set background=dark

set guifont=Fantasque\ Sans\ Mono:h10 "gotta install this in every computer
au GUIEnter * simalt ~x "start out gvim maximized
set showcmd             " show command in bottom bar
set cursorline          " highlight current line :hi CursorLine   cterm=NONE ctermbg=blue "ctermfg=white 
":hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]

"Jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"Permanent status bar 
set laststatus=2
set statusline=%f "tail of the filename

nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>
"======================================================================================
"Tabs and Spaces
set tabstop=4       " number of visual spaces per TAB"
set shiftwidth=4    " size of an "indent" 
set softtabstop=4   " number of spaces in tab when editing
"TABS!!!
set noexpandtab       " always tabs
autocmd Filetype html setlocal ts=2 sts=2 sw=2 noexpandtab
autocmd Filetype css setlocal ts=2 sts=2 sw=2 noexpandtab
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2 noexpandtab
autocmd Filetype jsx setlocal ts=2 sts=2 sw=2 noexpandtab

au BufRead,BufNewFile *.dart set filetype=dart "automatic Dart file type detection

"View indentation levels (for tabs only; there's a plugin for spaces)
:set listchars=tab:\|\ 
:set list

" Highlights NOTE same as in group Todo
match Todo "NOTE"
"======================================================================================
"SEARCHING
"======================================================================================
"Ignore case when doing a search
set ignorecase smartcase
" Search as characters are entered
set incsearch           
" Highlight matches
set hlsearch            
"Remove highlight
nnoremap <silent> _ :nohl<CR>
"======================================================================================
"FOLDING
"======================================================================================
set foldenable          " enable folding
set foldmethod=indent   " fold based on indent level
set foldlevelstart=8   " open most folds by default
set foldnestmax=10      " 10 nested fold max
"<Space> to open/close folds
nnoremap <space> za
"======================================================================================
"MOVEMENT
"======================================================================================
"Move vertically by visual line
nnoremap j gj
nnoremap k gk

"Move to beginning/end of line
nnoremap B ^
nnoremap E $

"Make $/^ not do anything
nnoremap $ <nop>
nnoremap ^ <nop>
"======================================================================================
"Leader Shortcuts
let mapleader=","       " leader is comma

"jk is escape
inoremap jk <esc>
inoremap JK <esc>
inoremap jK <esc>
inoremap Jk <esc>
"======================================================================================
"Backspace issue in Windows
set backspace=2
set backspace=indent,eol,start
"======================================================================================
"Comments
autocmd FileType jsx setlocal commentstring={/*\ %s\ */} "Make JSX comments /* */ instead of //

" Disable beeping and flashing.
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Use smarter defaults
set smartindent
set smarttab

"======================================================================================
"Copy and Pasting - these are insanely useful
"======================================================================================
" Map Ctrl+V to paste in Insert mode
imap <C-V> <C-R>* 

" Map Ctrl+C to copy in Visual mode
vmap <C-C> "+y

" Add paste shortcut
nmap <leader>P "+p
"======================================================================================

"======================================================================================
" PLUGINS
"======================================================================================
"DelimitMate
"automatically add spaces after pressing <Enter> (auto indent)
let delimitMate_expand_cr=1
let delimitMate_expand_space=1
"======================================================================================
"WindowSwap
let g:windowswap_map_keys=0 "prevent default bindings
nnoremap <silent> <leader>yw :call WindowSwap#MarkWindowSwap()<CR>
nnoremap <silent> <leader>pw :call WindowSwap#DoWindowSwap()<CR>
nnoremap <silent> <leader>wwa :call WindowSwap#EasyWindowSwap()<CR>
"======================================================================================
"Emmet-vim
let g:user_emmet_install_global=0
"enable just for HTML, CSS, and JavaScript
autocmd FileType html,css,javascript EmmetInstall
let g:user_emmet_settings={
	\  'javascript.jsx' : {
		\      'extends' : 'jsx',
		\  },
	\}
"remap the default <C-y> leader
"let g:user_emmet_leader_key='<C-Z>'
"======================================================================================
"Bbye
nnoremap <Leader>q :Bdelete<CR>
"======================================================================================
"vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight=1
let g:cpp_member_variable_highlight=1
let g:cpp_class_decl_highlight=1
"======================================================================================
"Nuake
nnoremap <F4> :Nuake<CR>
inoremap <F4> <C-\><C-n>:Nuake<CR>
tnoremap <F4> <C-\><C-n>:Nuake<CR>
let g:nuake_size=0.50
"======================================================================================
" Gruvbox
let g:gruvbox_bold=1
let g:gruvbox_italic=1
let g:gruvbox_underline=1
let g:gruvbox_undercurl=1
"======================================================================================
"Signify
let g:signify_realtime=1
let g:signify_sign_delete="-"
"======================================================================================
"/uftabline
let g:buftabline_numbers=1
"======================================================================================
"lightline.vim
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }
"======================================================================================
"Airline
" let g:airline#extensions#tabline#enabled=1
" let g:airline#extensions#tabline#show_tab_nr=1
" let g:airline_powerline_fonts=1
" let g:airline_detect_modified=1
"======================================================================================
"javacomplete2
autocmd FileType java setlocal omnifunc=javacomplete#Complete
"Inserting imports
nmap <F5> <Plug>(JavaComplete-Imports-AddSmart)
imap <F5> <Plug>(JavaComplete-Imports-AddSmart)
"Removing unused imports
nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
imap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
" "======================================================================================
" "coc.vim
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"======================================================================================
"Flutter
" nnoremap <leader>fa :FlutterRun<cr>
" nnoremap <leader>fq :FlutterQuit<cr>
" nnoremap <leader>fr :FlutterHotReload<cr>
" nnoremap <leader>fR :FlutterHotRestart<cr>
"======================================================================================
"Tagbar
nmap <F8> :TagbarToggle<CR>
"======================================================================================
"Undotree
nnoremap <F5> :UndotreeToggle<cr>
"======================================================================================
"dart-vim-plugin
let dart_html_in_string=v:true
let dart_style_guide=2

augroup fl_dart
  autocmd!
  autocmd Syntax dart highlight default link dartFlutterClasses     Type
  autocmd Syntax dart highlight default link dartFlutterTypedefs    Typedef
  autocmd Syntax dart highlight default link dartFlutterExceptions  Exception
  autocmd Syntax dart highlight default link dartFlutterConstants   Constant
  autocmd Syntax dart highlight default link dartFlutterEnums       Type
  autocmd Syntax dart highlight default link dartFlutterMixins      Type
  autocmd Syntax dart syntax keyword dartFlutterMixins
   \ AnimationEagerListenerMixin AnimationLazyListenerMixin
   \ AnimationLocalListenersMixin AnimationLocalStatusListenersMixin
   \ AnimationWithParentMixin AutomaticKeepAliveClientMixin LocalHistoryRoute
   \ PaintingBinding SingleTickerProviderStateMixin TickerProviderStateMixin
   \ ViewportNotificationMixin WidgetInspectorService WidgetsBinding
  autocmd Syntax dart syntax keyword dartFlutterEnums
   \ AnimationBehavior AnimationStatus AppLifecycleState Axis AxisDirection
   \ BannerLocation BlendMode BlurStyle BorderStyle BoxFit BoxShape Clip
   \ ConnectionState CrossAxisAlignment CrossFadeState DecorationPosition
   \ DiagnosticLevel DismissDirection DragAnchor FadeInImagePhase FilterQuality
   \ FlexFit FlutterLogoStyle FontStyle GrowthDirection HeroFlightDirection
   \ HitTestBehavior ImageRepeat MainAxisAlignment MainAxisSize Orientation
   \ Overflow PaintingStyle PathFillType PathOperation RenderComparison
   \ RoutePopDisposition SelectionChangedCause StackFit StrokeCap StrokeJoin
   \ TableCellVerticalAlignment TargetPlatform TextAffinity TextAlign
   \ TextBaseline TextDecorationStyle TextDirection TextOverflow
   \ TextSelectionHandleType TileMode VertexMode VerticalDirection WrapAlignment
   \ WrapCrossAlignment
  autocmd Syntax dart syntax keyword dartFlutterConstants
   \ immutable kAlwaysCompleteAnimation kAlwaysDismissedAnimation mustCallSuper
   \ optionalTypeArgs protected required visibleForTesting
  autocmd Syntax dart syntax keyword dartFlutterExceptions
   \ FlutterError TickerCanceled
  autocmd Syntax dart syntax keyword dartFlutterTypedefs
   \ AnimatedCrossFadeBuilder AnimatedListItemBuilder
   \ AnimatedListRemovedItemBuilder AnimatedSwitcherLayoutBuilder
   \ AnimatedSwitcherTransitionBuilder AnimationStatusListener
   \ AsyncWidgetBuilder ControlsWidgetBuilder CreateRectTween
   \ DismissDirectionCallback DragEndCallback DraggableCanceledCallback
   \ DragTargetAccept DragTargetBuilder DragTargetLeave DragTargetWillAccept
   \ ElementVisitor ErrorWidgetBuilder FormFieldBuilder FormFieldSetter
   \ FormFieldValidator GenerateAppTitle GestureDragCancelCallback
   \ GestureDragDownCallback GestureDragEndCallback GestureDragStartCallback
   \ GestureDragUpdateCallback GestureLongPressCallback
   \ GestureRecognizerFactoryConstructor GestureRecognizerFactoryInitializer
   \ GestureScaleEndCallback GestureScaleStartCallback
   \ GestureScaleUpdateCallback GestureTapCallback GestureTapCancelCallback
   \ GestureTapDownCallback GestureTapUpCallback HeroFlightShuttleBuilder
   \ ImageErrorListener ImageListener IndexedWidgetBuilder
   \ InspectorSelectButtonBuilder InspectorSelectionChangedCallback
   \ LayoutWidgetBuilder LocaleListResolutionCallback LocaleResolutionCallback
   \ NestedScrollViewHeaderSliversBuilder NotificationListenerCallback
   \ OrientationWidgetBuilder PageRouteFactory PointerCancelEventListener
   \ PointerDownEventListener PointerMoveEventListener PointerUpEventListener
   \ RebuildDirtyWidgetCallback RouteFactory RoutePageBuilder RoutePredicate
   \ RouteTransitionsBuilder ScrollNotificationPredicate
   \ SelectionChangedCallback SemanticIndexCallback SemanticsBuilderCallback
   \ ShaderCallback StatefulWidgetBuilder StateSetter
   \ TextSelectionOverlayChanged TransitionBuilder TweenConstructor TweenVisitor
   \ ValueChanged ValueGetter ValueSetter ValueWidgetBuilder ViewportBuilder
   \ VoidCallback WidgetBuilder WillPopCallback
  autocmd Syntax dart syntax keyword dartFlutterClasses
   \ AbsorbPointer Align Alignment AlignmentDirectional AlignmentGeometry
   \ AlignmentGeometryTween AlignmentTween AlignTransition AlwaysScrollableScrollPhysics
   \ AlwaysStoppedAnimation AndroidView Animatable AnimatedAlign AnimatedBuilder
   \ AnimatedContainer AnimatedCrossFade AnimatedDefaultTextStyle AnimatedList
   \ AnimatedListState AnimatedModalBarrier AnimatedOpacity AnimatedPadding
   \ AnimatedPhysicalModel AnimatedPositioned AnimatedPositionedDirectional AnimatedSize
   \ AnimatedSwitcher AnimatedWidget AnimatedWidgetBaseState Animation AnimationController
   \ AnimationMax AnimationMean AnimationMin AnnotatedRegion AspectRatio
   \ AssetBundleImageProvider AssetImage AsyncSnapshot AutomaticKeepAlive BackdropFilter
   \ BallisticScrollActivity Banner BannerPainter Baseline BeveledRectangleBorder
   \ BlockSemantics Border BorderDirectional BorderRadius BorderRadiusDirectional
   \ BorderRadiusGeometry BorderRadiusTween BorderSide BorderTween BottomNavigationBarItem
   \ BouncingScrollPhysics BouncingScrollSimulation BoxBorder BoxConstraints
   \ BoxConstraintsTween BoxDecoration BoxPainter BoxScrollView BoxShadow BuildContext
   \ Builder BuildOwner Canvas Center ChangeNotifier CheckedModeBanner CircleBorder
   \ CircularNotchedRectangle ClampingScrollPhysics ClampingScrollSimulation ClipContext
   \ ClipOval ClipPath ClipRect ClipRRect Color ColorFilter ColorSwatch ColorTween
   \ Column ComponentElement CompositedTransformFollower CompositedTransformTarget
   \ CompoundAnimation ConstantTween ConstrainedBox Container Cubic Curve
   \ CurvedAnimation Curves CurveTween CustomClipper CustomMultiChildLayout
   \ CustomPaint CustomPainter CustomPainterSemantics CustomScrollView
   \ CustomSingleChildLayout DecoratedBox DecoratedBoxTransition Decoration
   \ DecorationImage DecorationImagePainter DecorationTween DefaultAssetBundle
   \ DefaultTextStyle DefaultTextStyleTransition DefaultWidgetsLocalizations
   \ Directionality Dismissible DragDownDetails DragEndDetails Draggable
   \ DraggableDetails DragScrollActivity DragStartDetails DragTarget
   \ DragUpdateDetails DrivenScrollActivity EdgeInsets EdgeInsetsDirectional
   \ EdgeInsetsGeometry EdgeInsetsGeometryTween EdgeInsetsTween EditableText
   \ EditableTextState ElasticInCurve ElasticInOutCurve ElasticOutCurve Element
   \ ErrorWidget ExactAssetImage ExcludeSemantics Expanded FadeInImage
   \ FadeTransition FileImage FittedBox FittedSizes FixedColumnWidth
   \ FixedExtentMetrics FixedExtentScrollController FixedExtentScrollPhysics
   \ FixedScrollMetrics Flex FlexColumnWidth Flexible FlippedCurve Flow
   \ FlowDelegate FlowPaintingContext FlutterErrorDetails FlutterLogoDecoration
   \ FocusManager FocusNode FocusScope FocusScopeNode FontWeight Form FormField
   \ FormFieldState FormState FractionallySizedBox FractionalOffset
   \ FractionalOffsetTween FractionalTranslation FractionColumnWidth
   \ FutureBuilder GestureDetector GestureRecognizerFactory AssetBundleImageKey
   \ GestureRecognizerFactoryWithHandlers GlobalKey GlobalObjectKey
   \ GlowingOverscrollIndicator Gradient GridPaper GridView Hero HeroController
   \ HoldScrollActivity HSLColor HSVColor Icon IconData IconTheme IconThemeData
   \ IdleScrollActivity IgnorePointer Image ImageCache ImageConfiguration
   \ ImageIcon ImageInfo ImageProvider ImageShader ImageStream
   \ ImageStreamCompleter ImplicitlyAnimatedWidget ImplicitlyAnimatedWidgetState
   \ IndexedSemantics IndexedStack InheritedElement InheritedModel
   \ InheritedModelElement InheritedNotifier InheritedWidget InspectorSelection
   \ Interval IntrinsicColumnWidth IntrinsicHeight IntrinsicWidth IntTween
   \ KeepAlive KeepAliveHandle KeepAliveNotification Key KeyedSubtree
   \ LabeledGlobalKey LayerLink LayoutBuilder LayoutChangedNotification LayoutId
   \ LeafRenderObjectElement LeafRenderObjectWidget LimitedBox LinearGradient
   \ ListBody Listenable Listener ListView ListWheelChildBuilderDelegate
   \ ListWheelChildDelegate ListWheelChildListDelegate
   \ ListWheelChildLoopingListDelegate ListWheelElement ListWheelScrollView
   \ ListWheelViewport Locale LocalHistoryEntry Localizations
   \ LocalizationsDelegate LocalKey LongPressDraggable MaskFilter Matrix4
   \ Matrix4Tween MatrixUtils MaxColumnWidth MediaQuery MediaQueryData
   \ MemoryImage MergeSemantics MetaData MinColumnWidth ModalBarrier ModalRoute
   \ MultiChildLayoutDelegate MultiChildRenderObjectElement
   \ MultiChildRenderObjectWidget MultiFrameImageStreamCompleter
   \ NavigationToolbar Navigator NavigatorObserver NavigatorState
   \ NestedScrollView NestedScrollViewViewport NetworkImage
   \ NeverScrollableScrollPhysics NotchedShape Notification NotificationListener
   \ ObjectKey Offset Offstage OneFrameImageStreamCompleter Opacity
   \ OrientationBuilder OverflowBox Overlay OverlayEntry OverlayRoute
   \ OverlayState OverscrollIndicatorNotification OverscrollNotification Padding
   \ PageController PageMetrics PageRoute PageRouteBuilder PageScrollPhysics
   \ PageStorage PageStorageBucket PageStorageKey PageView Paint PaintingContext
   \ ParentDataElement ParentDataWidget Path PerformanceOverlay PhysicalModel
   \ PhysicalShape Placeholder PointerCancelEvent PointerDownEvent PointerEvent
   \ PointerMoveEvent PointerUpEvent PopupRoute Positioned PositionedDirectional
   \ PositionedTransition PreferredSize PreferredSizeWidget
   \ PrimaryScrollController ProxyAnimation ProxyElement ProxyWidget
   \ RadialGradient Radius RawGestureDetector RawGestureDetectorState RawImage
   \ RawKeyboardListener RawKeyEvent Rect RectTween RelativePositionedTransition
   \ RelativeRect RelativeRectTween RenderBox RenderNestedScrollViewViewport
   \ RenderObject RenderObjectElement RenderObjectToWidgetAdapter
   \ RenderObjectToWidgetElement RenderObjectWidget RenderSliverOverlapAbsorber
   \ RenderSliverOverlapInjector RepaintBoundary ReverseAnimation ReverseTween
   \ RichText RootRenderObjectElement RotatedBox RotationTransition
   \ RoundedRectangleBorder Route RouteAware RouteObserver RouteSettings Row
   \ RRect RSTransform SafeArea SawTooth ScaleEndDetails ScaleStartDetails
   \ ScaleTransition ScaleUpdateDetails Scrollable ScrollableState
   \ ScrollActivity ScrollActivityDelegate ScrollbarPainter ScrollBehavior
   \ ScrollConfiguration ScrollContext ScrollController ScrollDragController
   \ ScrollEndNotification ScrollHoldController ScrollMetrics ScrollNotification
   \ ScrollPhysics ScrollPosition ScrollPositionWithSingleContext
   \ ScrollSpringSimulation ScrollStartNotification ScrollUpdateNotification
   \ ScrollView Semantics SemanticsDebugger Shader ShaderMask Shadow ShapeBorder
   \ ShapeBorderClipper ShapeDecoration ShrinkWrappingViewport Simulation
   \ SingleChildLayoutDelegate SingleChildRenderObjectElement
   \ SingleChildRenderObjectWidget SingleChildScrollView Size
   \ SizeChangedLayoutNotification SizeChangedLayoutNotifier SizedBox
   \ SizedOverflowBox SizeTransition SizeTween SlideTransition
   \ SliverChildBuilderDelegate SliverChildDelegate SliverChildListDelegate
   \ SliverFillRemaining SliverFillViewport SliverFixedExtentList SliverGrid
   \ SliverGridDelegate SliverGridDelegateWithFixedCrossAxisCount
   \ SliverGridDelegateWithMaxCrossAxisExtent SliverList
   \ SliverMultiBoxAdaptorElement SliverMultiBoxAdaptorWidget
   \ SliverOverlapAbsorber SliverOverlapAbsorberHandle SliverOverlapInjector
   \ SliverPadding SliverPersistentHeader SliverPersistentHeaderDelegate
   \ SliverPrototypeExtentList SliverSafeArea SliverToBoxAdapter
   \ SliverWithKeepAliveWidget Spacer Stack StadiumBorder State StatefulBuilder
   \ StatefulElement StatefulWidget StatelessElement StatelessWidget
   \ StatusTransitionWidget StepTween StreamBuilder StreamBuilderBase
   \ SweepGradient Table TableBorder TableCell TableColumnWidth TableRow
   \ TapDownDetails TapUpDetails Text TextBox TextDecoration
   \ TextEditingController TextEditingValue TextInputType TextPainter
   \ TextPosition TextRange TextSelection TextSelectionControls
   \ TextSelectionDelegate TextSelectionOverlay TextSpan TextStyle
   \ TextStyleTween Texture Threshold TickerFuture TickerMode TickerProvider
   \ Title Tolerance TrackingScrollController TrainHoppingAnimation Transform
   \ TransformProperty TransitionRoute Tween TweenSequence TweenSequenceItem
   \ TypeMatcher UiKitView UnconstrainedBox UniqueKey UniqueWidget
   \ UserScrollNotification ValueKey ValueListenableBuilder ValueNotifier
   \ Velocity Viewport Visibility Widget WidgetInspector WidgetsApp
   \ WidgetsBindingObserver WidgetsFlutterBinding WidgetsLocalizations
   \ WidgetToRenderBoxAdapter WillPopScope Wrap

augroup end

